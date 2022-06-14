require "active_support/concern"

module Rails
  module Typeform
    module ControllerSupport
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
