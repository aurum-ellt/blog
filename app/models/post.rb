class Post < ApplicationRecord
  include Availability, Sluggable

  enum :status, %i[ draft published archived ], default: :draft, validate: true
  has_rich_text :body

  belongs_to :user, default: -> { Current.user }

  validates :title, presence: true

  after_update :mark_as_published, if: -> { saved_change_to_status? && self.published? }

  private
    def mark_as_published
      self.touch(:published_at)
    end
end
