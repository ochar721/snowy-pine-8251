class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.passenger_names
    joins(:passengers)
    .where("passengers.age >= 18 ")
    .group(:id)
    .pluck(:name)
  
  end
end
