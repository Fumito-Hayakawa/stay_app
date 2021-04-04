class User < ApplicationRecord
  has_many :rooms
  has_many :reservations

  has_secure_password
  has_one_attached :image
  
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

end
