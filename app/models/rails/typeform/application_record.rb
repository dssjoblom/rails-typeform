module Rails
  module Typeform
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
