# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airline.destroy_all
Passenger.destroy_all
Flight.destroy_all
FlightPassenger.destroy_all

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
