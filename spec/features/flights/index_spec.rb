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
    visit "/flights"
  end

  it "shows a list of all flight numbers, and next to the flight i see the name of the airline" do
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)

    expect(page).to have_content("South West")
    expect(page).to have_content("United Airlines")
  end

  it "it shows all passegner names of the flight" do
    expect(page).to have_content(@olivia.name)
    expect(page).to have_content(@mccall.name)
    expect(page).to have_content(@grinch.name)

    expect(page).to have_content(@morgan.name)
    expect(page).to have_content(@pete.name)
    expect(page).to have_content(@parker.name)
  end

  it "has a button to remove passengers" do
    expect(@pete.name).to have_button("Remove Passenger")
    click_button("Remove Passenger")
    expect(current_path).to eq("/flights")
    expect(page).to_not have_contenct(@pete.name)
  end
end
