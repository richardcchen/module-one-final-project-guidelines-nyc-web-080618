class Ingredient < ActiveRecord::Base
  has_many :salad_ingredients
  has_many :salads, through: :salad_ingredients
end
