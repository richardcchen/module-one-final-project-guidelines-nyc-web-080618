class Store < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders
  has_many :ingredients, through: :orders

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

  def total_cost_of_goods_purchased
    total = self.calculate_total_cost
    puts "Total Cost of Ingredients: $#{total}"
  end

  def calculate_total_cost
    total = 0
    self.ingredients.each do |each_ingredient|
      total += each_ingredient[:cost]
    end
    total
  end

  def self.calculate_company_food_costs
    total = 0
      self.all.each do |each_store|
        store_total = each_store.calculate_total_cost
        total += store_total
      end
      total
  end

  def display_ingredients_cost
    a = calculate_store_food
    a.each do |name, cost|
      puts "#{name}: $#{cost}"
    end
  end

  def calculate_store_food
    a = {}
    self.ingredients.each do |each_ingredient|
      if a[each_ingredient.name] == nil
        a[each_ingredient.name] = each_ingredient.cost
      else
        a[each_ingredient.name] += each_ingredient.cost
      end
    end
    a
  end

  def calculate_food_cost
    inv_cost = self.calculate_total_cost
    store_sales = self.sales
    food_cost = (inv_cost.to_f / sales.to_f) * 100
    food_cost = food_cost.to_i
  end

  def display_food_cost
    food_cost = self.calculate_food_cost
    puts "Food Cost: #{food_cost}%"
  end

  def self.display_stores
    self.all.each do |each_store|
      puts "Name: #{each_store.name}, Location: #{each_store.location}, Sales: #{each_store.sales}, CustomerCount: #{each_store.customer_count}"
    end
    return nil
  end

  def self.store_array
    a = []
    self.all.each do |each_store|
      a << each_store
    end
    a
  end



end #end of class
