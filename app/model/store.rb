class Store < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def self.update_sales
    self.all.each do |each_store|
      total_sales = 0
      each_store.orders.each do |each_order|
        total_sales += each_order[:total]
      end
    Store.update(each_store.id, sales: total_sales)
    end
  end

  def self.total_company_sales
    total = 0
    self.all.each do |each_store|
      each_store.orders.each do |each_order|
        total += each_order[:total]
      end
    end
    total
  end

  def self.update_customer_count
    self.all.each do |each_store|
      total = each_store.orders.count
      Store.update(each_store.id, customer_count: total)
    end
  end

  def self.get_store_info(name)
    store_object = self.find_by({name: name})
    if store_object == nil
      return puts "No record of #{name} in database"
    else
       store_object = self.find_by({name: name})
    end
  end

  def self.delete_store(name)
    if self.get_store_info(name) == nil
      return nil
    else
      self.get_store_info(name).destroy
      puts "#{name} has been bulldozed!"
    end
  end


end #end of class
