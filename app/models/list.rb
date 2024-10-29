class List < ApplicationRecord
  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists
end
