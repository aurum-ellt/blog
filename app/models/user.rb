class User < ApplicationRecord
  include Sluggable

  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :subscribers, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :small, resize_to_limit: [ 100, 100 ]
  end
  has_rich_text :bio

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:password_digest] }
  validates :name, presence: true, length: { maximum: 34 }
  validates :avatar, blob: { content_type: %w[image/jpeg image/png image/webp], max_size: 5.megabytes }
end
