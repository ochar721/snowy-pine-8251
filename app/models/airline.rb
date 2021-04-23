class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def passengers
    self.flights
    joins(:passengers)
    .where("passegner.age >= 18")
    .pluck(:name)
    .distinct
  end
end
