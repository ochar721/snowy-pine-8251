require 'rails_helper'

RSpec.describe 'fight index spec' do
  before(:each)do
    @southwest = Airline.create(name: "South West")
    @united = Airline.create(name: "United Airlines")

    @flight1 = @southwest.flights.create(number: "234", date: "12/12/12", departure_city: "PHL", arrival_city: "ORD")
    @flight2 = @united.flights.create(number: "456", date: "1/20/20", departure_city: "LAX", arrival_city: "ORL")

    @olivia = Passenger.create(name: "Olivia", age: 28)
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
    visit "airlines/#{@united.id}"
  end

  it "I see a list of passengers that have flights on that airline, its unique and only includes adults" do
    expect(page).to have_content("Passengers with #{@united.name}")
    expect(page).to have_content(@morgan.name)
    expect(page).to have_content(@pete.name)
    expect(page).to_not have_content(@parker.name)
  end
end
