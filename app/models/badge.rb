class Badge < ApplicationRecord
  belongs_to :rule

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
end
