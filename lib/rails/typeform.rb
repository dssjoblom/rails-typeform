require "rails/typeform/version"
require "rails/typeform/engine"
require "active_support/concern"

module Rails
  module Typeform
    # Your code goes here...

    module Controller
      extend ActiveSupport::Concern

      included do
        # Adds default load trigger. New triggers can be added with add_feedback_trigger
        before_action :init_feedback_forms
      end

      def init_feedback_forms
        controller = params[:controller]
        action = params[:action]
        @feedback_forms = []
        @feedback_form_triggers = []
        @feedback_form_triggers.push '*/*:load'
        @feedback_form_triggers.push "#{controller}/*:load"
        @feedback_form_triggers.push "#{controller}/#{action}:load"
        @processed_triggers = 0
        recreate_feedback_forms
      end

      def add_feedback_trigger(trigger)
        @feedback_form_triggers.push trigger
        recreate_feedback_forms
      end

      def recreate_feedback_forms
        for trigger in @feedback_form_triggers[@processed_triggers..]
          for form in FeedbackForm.where("trigger = ? and (language = ? or language = '*') and enabled = true",
                                         trigger,
                                         I18n.locale.to_s)
            if form.logged_in_only and not user_signed_in?
              next
            end

            beta_tester = false
            if defined?(current_user.beta_tester)
              beta_tester = current_user.beta_tester
            end

            if form.logged_in_beta_tester_only and (not user_signed_in? or not beta_tester)
              next
            end

            @feedback_forms.push form
          end
        end
        @processed_triggers = @feedback_form_triggers.length
        @feedback_form = @feedback_forms.max_by { |f| [f.priority, f.language] }
        @feedback_form_nudge = false
        if @feedback_form
          if @feedback_form.trigger !~ /^.*\/.*:.*$/
            @feedback_form_nudge = true
          end
        end
      end
    end
  end
end
