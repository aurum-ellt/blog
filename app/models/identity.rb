class Identity < ApplicationRecord
  belongs_to :user

  validates :provider_uid, :provider_name, presence: true
end
