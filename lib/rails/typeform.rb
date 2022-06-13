require "rails/typeform/version"
require "rails/typeform/engine"
require "active_support/concern"

module Rails
  module Typeform
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
        @rails_typeform_config.add_trigger '*/*:load'
        @rails_typeform_config.add_trigger "#{controller}/*:load"
        @rails_typeform_config.add_trigger "#{controller}/#{action}:load"
        @rails_typeform_config.recreate
      end
    end
  end
end
