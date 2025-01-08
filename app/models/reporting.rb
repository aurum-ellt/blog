class Reporting < ApplicationRecord
  enum :category, %i[ vulgarity harassment copyright other], validate: true
  validates :url, presence: true
end
