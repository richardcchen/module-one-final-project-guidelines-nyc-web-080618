require 'pry'
require 'faker'

Customer.destroy_all
Store.destroy_all
Order.destroy_all
Salad.destroy_all
OrderSalad.destroy_all
# puts "making dem trees tho"
# Tree.create(name: Faker::DragonBall.character, kind: Faker::Food.fruits)
# Tree.create(name: Faker::DragonBall.character, kind: Faker::Food.fruits)
# Tree.create(name: Faker::DragonBall.character, kind: Faker::Food.fruits)
# Tree.create(name: Faker::DragonBall.character, kind: Faker::Food.fruits)
# puts "done with trees"

puts "Making Customer"
30.times do
  Customer.create(name: Faker::Superhero.name)
end
puts "Done Making Customers"

puts "Making Stores"
10.times do
  Store.create(name: Faker::Pokemon.name, location: Faker::Pokemon.location)
end
puts "Done Making Stores"

puts "Making Orders"
  100.times do
    Order.create(customer_id: Customer.all.sample.id, store_id: Store.all.sample.id, total: rand(1..100))
  end
puts "Done Making Orders"

puts "Making Salads"
  Salad.create(name: "Kale Caesar", price: 10)
  Salad.create(name: "Harvest Bowl", price: 13)
  Salad.create(name: "Chicken Pesto Parm", price: 14)
  Salad.create(name: "Hummus Tahina", price: 15)
  Salad.create(name: "Spicy Szabi", price: 9)
  Salad.create(name: "Guacamole Green", price: 10)
  Salad.create(name: "Shroomami", price: 14)
  Salad.create(name: "Curry Chickpea", price: 12)
  Salad.create(name: "Beets Don't Kale My Vibe", price: 13)
  Salad.create(name: "Fish Taco", price: 16)
puts "Done Making Salads"

puts "Making Order_Salads"
  100.times do
    OrderSalad.create(order_id: Order.all.sample.id, salad_id: Salad.all.sample.id)
  end
puts "Done Making Orders_Salads"

puts "Making Ingredients"
Ingredient.create(name: "Romaine", cost: rand(1..50), calories: rand(1..200))
Ingredient.create(name: "Mesclun", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Spinach", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Arugula", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Tomato", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Onion", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Cilantro", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Basil", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Chicken", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Fish", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Corn", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Sweet Potatoes", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Broccoli", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Avocado", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Cheese", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Egg", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Chickenpea", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Kale", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Croutons", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Lentils", cost: rand(1..100), calories: rand(1..200))
Ingredient.create(name: "Asparagus", cost: rand(1..100), calories: rand(1..200))
puts "Done making ingredients"
