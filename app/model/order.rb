class Order < ActiveRecord::Base

  belongs_to :customer
  belongs_to :store
  has_many :order_salads
  has_many :salads, through: :order_salads
  has_many :ingredients, through: :salads

  def self.get_order_info(order_id)
    order_object = self.find_by({id: order_id})
    if order_object == nil
      return puts "No record of #{order_id} in database"
    else
       order_object = self.find_by({id: order_id})
    end
  end

  def self.delete_order(order_id)
    if self.get_order_info(order_id) == nil
      return nil
    else
      self.get_order_info(order_id).destroy
      puts "#{order_id} has been removed"
    end
  end

  def self.display_orders
    self.all.map do |each_order|
      #binding.pry
      puts "ID: #{each_order.id}, Total: #{each_order.total}, CustomerName: #{each_order.customer.name}, StoreName: #{each_order.store.name}"
    end
  end

end
