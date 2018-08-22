class Salad < ActiveRecord::Base
  has_many :order_salads
  has_many :orders, through: :order_salads
  has_many :salad_ingredients
  has_many :ingredients, through: :salad_ingredients
end
