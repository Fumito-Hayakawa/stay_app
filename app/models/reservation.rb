class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_number, presence: true, numericality: true
  validates :total_price, presence: true, numericality: true


end
