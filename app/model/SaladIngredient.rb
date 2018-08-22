class SaladIngredients < ActiveRecord::Base
  belongs_to :salad
  belongs_to :ingredient
end
