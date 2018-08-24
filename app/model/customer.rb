class Customer < ActiveRecord::Base
  has_many :orders
  has_many :stores, through: :orders

  def self.update_total_spend
    self.all.each do |customer_instance|
      total = 0
      customer_instance.orders.each do |each_order|
         total += each_order[:total]
      end
      Customer.update(customer_instance.id, total_spend: total)
    end
  end

  def self.update_number_of_visits
    self.all.each do |customer_instance|
      total = customer_instance.orders.count
      Customer.update(customer_instance.id, num_of_visits: total)
    end
  end

  def self.get_customer_info(name)
    customer_object = self.find_by({name: name})
    #binding.pry
    if customer_object == nil
      return puts "No record of #{name} in database"
    else
       customer_object = self.find_by({name: name})
    end
  end

  def self.delete_customer(name)
    if self.get_customer_info(name) == nil
      return nil
    else
      self.get_customer_info(name).destroy
      puts "#{name} has been removed"
    end
  end

  def self.display_customers
    self.all.each do |each_customer|
      puts "Name: #{each_customer.name}, TotalSpend: #{each_customer.total_spend}, #ofVisits:#{each_customer.num_of_visits}"
    end
    return nil
  end

  def add_order(order)
    
  end
end #end of class
