class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_lists
  has_many :lists, through: :user_lists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
