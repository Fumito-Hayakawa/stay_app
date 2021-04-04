class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: true
  validates :name, presence: true
  validates :address, presence: true



  def self.search(search)
    if search
      Room.where('address LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end


end
