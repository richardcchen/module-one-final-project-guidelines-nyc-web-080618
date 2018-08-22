class OrderSalad < ActiveRecord::Base
  belongs_to :salad
  belongs_to :order
end
