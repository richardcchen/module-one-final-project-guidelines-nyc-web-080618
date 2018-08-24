class Order < ActiveRecord::Base

  belongs_to :customer
  belongs_to :store
  has_many :order_salads
  has_many :salads, through: :order_salads
  has_many :ingredients, through: :salads

  def update_total_price
    total = 0
    self.salads.each do |each_salad|
      total += each_salad.price
    end
    total
  end

  def self.update_all_order_prices
    Order.all.each do |each_order|
      order_price = each_order.update_total_price
      Order.update(each_order.id, total: order_price)
    end
  end


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
      puts "#{order_id} has been removed".colorize(:red).bold
    end
  end

  def self.display_orders
    self.all.map do |each_order|
      if each_order.customer_id != nil && each_order.store_id != nil
      #binding.pry
        puts "ID: #{each_order.id}         ".colorize(:green) + " Total: $#{each_order.total}       ".colorize(:yellow) + " CustomerName: #{each_order.customer.name}                   ".colorize(:blue) + " StoreName: #{each_order.store.name}".colorize(:brown)
      end
    end
  end

  def display_order_summary
    self.update_total_price
    puts "Here is a summary of your order:"
    self.reload
    self.salads.each do |each_salad|
      puts "#{each_salad.name}: #{each_salad.price}".colorize(:yellow)
    end
    puts "Total Order: #{self.total}".colorize(:green).bold
  end

end
