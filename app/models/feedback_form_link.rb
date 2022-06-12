class FeedbackFormLink < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true

  belongs_to :feedback_form
end
