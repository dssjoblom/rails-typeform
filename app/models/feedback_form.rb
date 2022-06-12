class FeedbackForm < ApplicationRecord
  validates :language, inclusion: { in: (I18n.available_locales.map(&:to_s) + ['*']) }
  validates :trigger, presence: true
  validates :typeform_id, presence: true

  has_many :feedback_form_links, dependent: :destroy
  alias_attribute :links, :feedback_form_links
end
