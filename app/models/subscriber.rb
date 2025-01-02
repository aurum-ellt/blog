class Subscriber < ApplicationRecord
  self.primary_key = %i[ email_address user_id ]

  belongs_to :user
  has_secure_token

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
