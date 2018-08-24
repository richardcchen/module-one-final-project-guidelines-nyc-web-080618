require 'pry'
require 'faker'

Customer.destroy_all
Store.destroy_all
Order.destroy_all
Salad.destroy_all
OrderSalad.destroy_all
Ingredient.destroy_all
SaladIngredient.destroy_all

puts "Making Customer"
30.times do
  Customer.create(name: Faker::Name.name, total_spend: 0, num_of_visits: 0)
end
puts "Done Making Customers"

puts "Making Stores"
Store.create(name: "Store1", location: Faker::Zelda.location)
Store.create(name: "Store2", location: Faker::Zelda.location)
Store.create(name: "Store3", location: Faker::Zelda.location)
Store.create(name: "Store4", location: Faker::Zelda.location)
Store.create(name: "Store5", location: Faker::Zelda.location)
Store.create(name: "Store6", location: Faker::Zelda.location)
Store.create(name: "Store7", location: Faker::Zelda.location)
Store.create(name: "Store8", location: Faker::Zelda.location)
Store.create(name: "Store9", location: Faker::Zelda.location)
Store.create(name: "Store10", location: Faker::Zelda.location)
puts "Done Making Stores"

puts "Making Orders"
  500.times do
    Order.create(customer_id: Customer.all.sample.id, store_id: Store.all.sample.id)
  end
puts "Done Making Orders"

puts "Making Salads"
  Salad.create(name: "Kale Caesar", price: 20)
  Salad.create(name: "Harvest Bowl", price: 23)
  Salad.create(name: "Chicken Pesto Parm", price: 24)
  Salad.create(name: "Hummus Tahina", price: 25)
  Salad.create(name: "Spicy Szabi", price: 29)
  Salad.create(name: "Guacamole Green", price: 20)
  Salad.create(name: "Shroomami", price: 24)
  Salad.create(name: "Curry Chickpea", price: 22)
  Salad.create(name: "Beets Don't Kale My Vibe", price: 23)
  Salad.create(name: "Fish Taco", price: 26)
puts "Done Making Salads"

puts "Making Order_Salads"
  3000.times do
    OrderSalad.create(order_id: Order.all.sample.id, salad_id: Salad.all.sample.id)
  end
puts "Done Making Orders_Salads"

puts "Making Ingredients"
Ingredient.create(name: "Romaine", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Mesclun", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Spinach", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Arugula", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Tomato", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Onion", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Cilantro", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Basil", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Chicken", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Fish", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Corn", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Sweet Potatoes", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Broccoli", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Avocado", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Cheese", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Egg", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Chickenpea", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Kale", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Croutons", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Lentils", cost: rand(1..3), calories: rand(1..10))
Ingredient.create(name: "Asparagus", cost: rand(1..3), calories: rand(1..10))
puts "Done making ingredients"

puts "Making salad_ingredients"
50.times do
SaladIngredient.create(salad_id: Salad.all.sample.id, ingredient_id: Ingredient.all.sample.id).reload
end
puts "Done Making Salad Ingredients"
