class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  scope :recent, -> { order(created_at: :desc).limit(12) }
end
