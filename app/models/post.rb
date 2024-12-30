class Post < ApplicationRecord
  include Sluggable

  enum :status, %i[ draft published archived ], default: :draft, validate: true
  has_rich_text :body

  belongs_to :user, default: -> { Current.user }

  validates :title, presence: true
end
