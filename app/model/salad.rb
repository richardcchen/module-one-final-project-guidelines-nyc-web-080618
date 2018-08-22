class Salad < ActiveRecord::Base
  has_many :order_salads
  has_many :orders, through: :order_salads
end
