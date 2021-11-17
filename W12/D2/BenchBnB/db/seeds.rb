# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Bench.delete_all

b1 = Bench.create!(
  description: "Rancho Park Bench",
  lat: 34.0449387069188,
  lng: -118.40879335432075,
)

b2 = Bench.create!(
  description: "WeHo Dog Park Bench",
  lat: 34.08369787583186,
  lng: -118.38461131603493,
)
