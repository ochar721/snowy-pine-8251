require 'rails_helper'

RSpec.describe Airline, type: :model do
  it {should have_many(:flights)}
  it {should have_many(:flight_passengers).through(:flights)}
  it {should have_many(:passengers).through(:flight_passengers)}

  describe "class methods" do
    before(:each)do
      @southwest = Airline.create(name: "South West")
      @united = Airline.create(name: "United Airlines")

      @flight1 = @southwest.flights.create(number: "234", date: "12/12/12", departure_city: "PHL", arrival_city: "ORD")
      @flight2 = @united.flights.create(number: "456", date: "1/20/20", departure_city: "LAX", arrival_city: "ORL")

      @olivia = Passenger.create(name: "Olivia", age: 28)
      @olivia1 = Passenger.create(name: "Olivia", age: 29)
      @mccall = Passenger.create(name: "McCall", age: 34)
      @grinch = Passenger.create(name: "Grinch", age: 2)
      @morgan = Passenger.create(name: "Morgan", age: 31)
      @pete = Passenger.create(name: "Pete", age: 33)
      @parker = Passenger.create(name: "Parker", age: 1)

      FlightPassenger.create(flight: @flight1, passenger: @olivia)
      FlightPassenger.create(flight: @flight1, passenger: @mccall)
      FlightPassenger.create(flight: @flight1, passenger: @grinch)
      FlightPassenger.create(flight: @flight2, passenger: @morgan)
      FlightPassenger.create(flight: @flight2, passenger: @pete)
      FlightPassenger.create(flight: @flight2, passenger: @parker)
    end

    describe "::passenger_names" do
        it 'lists the unique passenger names who are over 18' do
          expect(Airline.passengers.to_a).to eq([@olivia.name, @mccall.name])
          expect(Airline.passengers.to_a).to_not eq([@grinch.name, @olivia1.name])
        end
      end
    end

end
