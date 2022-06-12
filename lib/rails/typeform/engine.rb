require 'browser'

module Rails
  module Typeform
    class Engine < ::Rails::Engine
      isolate_namespace Rails::Typeform
    end
  end
end
