class Post < ApplicationRecord
  include Availability, Sluggable

  enum :status, %i[ draft published archived ], default: :draft, validate: true
  has_rich_text :body

  belongs_to :user, default: -> { Current.user }

  validates :title, presence: true
  validate :status_cannot_be_published_without_name

  private
    def status_cannot_be_published_without_name
      if published? && user.name.blank?
        errors.add(:status, "can't be publish without a name")
      end
    end
end
