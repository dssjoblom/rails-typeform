module Rails
  module Typeform
    class FormConfig
      attr_accessor :triggers,
                    :processed_triggers,
                    :forms,
                    :form,
                    :nudge,
                    :hidden_variables,
                    :show_in_new_window

      def initialize
        self.triggers = []
        self.processed_triggers = 0
        self.forms = []
        self.nudge = false
        self.hidden_variables = {}
        self.show_in_new_window = false
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
          for form in Rails::Typeform::FeedbackForm.where("trigger = ? and (language = ? or language = '*') and enabled = true",
                                                          trigger,
                                                          I18n.locale.to_s)
            self.forms.push form
          end
        end

        self.processed_triggers = self.triggers.length
        self.form = self.forms.max_by { |f| [f.priority, f.language] }
      end
    end
  end
end
