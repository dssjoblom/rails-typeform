require "rails/typeform/version"
require "rails/typeform/engine"
require "rails/typeform/form_config"
require "rails/typeform/controller_support"
require "active_support/concern"

module Rails
  module Typeform
    ActiveSupport.on_load(:action_controller_base) do
      include Rails::Typeform::ControllerSupport
    end
  end
end
