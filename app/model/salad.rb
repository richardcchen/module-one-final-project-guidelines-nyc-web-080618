class Salad < ActiveRecord::Base
  has_many :order_salads
  has_many :orders, through: :order_salads
  has_many :salad_ingredients
  has_many :ingredients, through: :salad_ingredients

def calculate_calories
  total = 0
  self.ingredients.each do |each_ingredient|
    total += each_ingredient.calories
  end
  total
end

def self.salad_options
  a = []
  Salad.all.each do |each_salad|
      a << each_salad
  end
  a
end




end
