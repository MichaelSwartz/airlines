# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

airlines = []
users = []

60.times do
  airlines << Airline.find_or_create_by(
    name: Faker::Company.name,
    link_url: Faker::Internet.url,
    logo_url: Faker::Company.logo,
    description: Faker::Company.bs
  )
end

20.times do
  users << User.create_with(
    password: Faker::Lorem.characters(10))
    .find_or_create_by(email: Faker::Internet.email)
end

10000.times do
  Review.create(
    user_id: users.sample.id,
    rating: (rand(1..4)),
    body: Faker::Lorem.sentence,
    airline_id: airlines.sample.id
  )
end
