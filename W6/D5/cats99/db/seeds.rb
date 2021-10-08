# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Cat.destroy_all

richard = Cat.create(
  birth_date: "1992/02/18",
  color: "black",
  name: "Richard",
  sex: "M",
  description: "New cat"
)

aji = Cat.create(
  birth_date: "2020/08/18",
  color: "white",
  name: "Aji",
  sex: "F",
  description: "actually a dog"
)

jared = Cat.create(
  birth_date: "1998/05/22",
  color: "brown",
  name: "Jared",
  sex: "M",
  description: "COO"
)

aji = Cat.create(
  birth_date: "2020/07/18",
  color: "yellow",
  name: "Lucki",
  sex: "F",
  description: "actually another dog"
)

end