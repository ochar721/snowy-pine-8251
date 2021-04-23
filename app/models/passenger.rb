class Passenger < ApplicationRecord
  has_many :flight_passengers, dependent: :destroy
  has_many :flights, through: :flight_passengers
  has_many :airlines, through: :flights
end
