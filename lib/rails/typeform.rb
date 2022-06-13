require "rails/typeform/version"
require "rails/typeform/engine"
require "active_support/concern"

module Rails
  module Typeform
    class FormConfig
      attr_accessor :triggers,
                    :processed_triggers,
                    :forms,
                    :form,
                    :nudge,
                    :hidden_variables

      def initialize
        self.triggers = []
        self.processed_triggers = 0
        self.forms = []
        self.nudge = false
        self.hidden_variables = {}
      end

      def add_trigger(trigger, do_recreate=true)
        triggers.push trigger
        if do_recreate
          recreate
        end
      end

      def add_hidden_variable(key, value)
        self.hidden_variables[key] = value
      end

      def encode_hidden_variables
        URI.encode_www_form(self.hidden_variables)
      end

      def recreate
        for trigger in triggers[processed_triggers..-1]
          for form in FeedbackForm.where("trigger = ? and (language = ? or language = '*') and enabled = true",
                                         trigger,
                                         I18n.locale.to_s)
            self.forms.push form
          end
        end

        self.processed_triggers = self.triggers.length
        self.form = self.forms.max_by { |f| [f.priority, f.language] }
      end
    end

    module Controller
      extend ActiveSupport::Concern

      included do
        # Adds default load trigger. New triggers can be added with add_feedback_trigger
        before_action :rails_typeform_init
      end

      def rails_typeform_init
        controller = params[:controller]
        action = params[:action]
        @rails_typeform_config = Rails::Typeform::FormConfig.new
        @rails_typeform_config.add_trigger '*/*:load', false
        @rails_typeform_config.add_trigger "#{controller}/*:load", false
        @rails_typeform_config.add_trigger "#{controller}/#{action}:load", false
        @rails_typeform_config.recreate
      end
    end
  end
end
