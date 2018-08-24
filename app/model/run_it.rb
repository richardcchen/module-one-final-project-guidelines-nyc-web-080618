class RunIt

  def welcome
    puts "Welcome to the TastyGreens User Interface. Please choose a number.".colorize(:green).bold
  end


  def main_screen_display
    puts "1. View/Edit customer info"
    puts "2. View/Edit order info"
    puts "3. View/Edit store info"
    puts "4. View company information"
    puts "5. Update to recent information"
    puts "6. Press if you are a customer".colorize(:blue).bold
    puts "7. Exit".colorize(:red)
  end

  def customer_display
    puts "1. Search for specific customer"
    puts "2. Delete customer"
    puts "3. Display all customer information"
    puts "4. Go back to main screen".colorize(:red)
  end

  def order_display
    puts "1. Search for specific order"
    puts "2. Delete order"
    puts "3. Display all order data"
    puts "3. Go back to main screen".colorize(:red)
  end

  def store_display
    puts "1. Search for specific store"
    puts "2. Bulldoze store"
    puts "3. Display all Store data"
    puts "4. Go back to main screen".colorize(:red)
  end

  def company_display
    puts "1. List all the customers"
    puts "2. List all the orders"
    puts "3. List all the stores"
    puts "4. List Total Aggregate Company Data"
  end

  def up_to_date
    Order.update_all_order_prices
    Customer.update_total_spend
    Customer.update_number_of_visits
    Store.update_sales
    Store.update_customer_count
  end

  def self.customer_options(cust_input)
    if cust_input == 1
      puts "Please enter customer name".colorize(:green).bold
      name = gets.chomp
      customer_info = Customer.get_customer_info(name)
      if customer_info != nil
        puts "Customer Name: #{customer_info.name}".colorize(:green)
        puts "Total Spend: $#{customer_info.total_spend}".colorize(:green)
        puts "Number of Visits: #{customer_info.num_of_visits}".colorize(:green)

        customer_info.orders.each do |each_order|
          puts "Order ID: #{each_order.id}"
          each_order.salads.each do |each_salad|
            puts "      #{each_salad.name}, $#{each_salad.price}"
          end
          puts "Order Total: $#{each_order.total}".colorize(:green)
          puts
          puts
        end
      end
      5.times do
        puts " "
      end
    elsif cust_input == 2
      puts "Please enter name to delete".colorize(:red)
      name = gets.chomp
      Customer.delete_customer(name)
    elsif cust_input == 3
      Customer.display_customers
      puts
      puts
      puts
    else 5.times do puts " " end
    end
  end

  def self.order_options(cust_input)
    if cust_input == 1
      puts "Please enter order number".colorize(:green)
      order_num = gets.chomp.to_i
      order_info = Order.get_order_info(order_num)
      if order_info != nil
          puts "Order ID: #{order_info.id}"
          order_info.salads.each do |each_salad|
            puts "      #{each_salad.name}, $#{each_salad.price}"
          end
          puts "Order Total: $#{order_info.total}".colorize(:green)
          puts
          puts
      end
      5.times do
        puts " "
      end
    elsif cust_input == 2
      puts "Please enter order number to delete".colorize(:red)
      order_id = gets.chomp
      order_id.to_i
      Order.delete_order(order_id)
    elsif cust_input == 3
      Order.display_orders
      puts
    else 5.times do puts " " end
    end
  end

  def self.store_options(cust_input)
    if cust_input == 1
      puts "Please enter store name".colorize(:green)
      name = gets.chomp
      store_info = Store.get_store_info(name)
      if store_info != nil
        puts "Store name: #{store_info.name}".bold
        puts "Location: #{store_info.location}".bold
        puts "Total Sales: $#{store_info.sales}".bold
        puts "Customer Count: #{store_info.customer_count}".bold
        store_info.display_food_cost
        puts
        puts
        puts "Inventory Sheet".underline
        puts
        store_info.display_ingredients_cost
        store_info.total_cost_of_goods_purchased
      end
      5.times do
        puts
      end
    elsif cust_input == 2
      puts "Please enter store name to delete".colorize(:red)
      name = gets.chomp
      Store.delete_store(name)
      puts
      puts
    elsif cust_input == 3
      Store.display_stores
      puts
      puts
    else 5.times do puts " " end
    end
  end

  def self.company_options(input)
      puts "Total Amount of Customers: #{Customer.all.count}".colorize(:green).bold
      puts "Total Amount of Orders: #{Order.all.count}".colorize(:green).bold
      puts "Total Amount of Stores: #{Store.all.count}".colorize(:green).bold
      total_sales = Store.total_company_sales
      puts "Total Company Sales: $#{total_sales}".colorize(:green).bold
      total_food_cost = Store.calculate_company_food_costs
      puts "Total Company Food Costs: $#{total_food_cost}".colorize(:green).bold
      food_percentage = (total_food_cost.to_f) / (total_sales.to_f) * 100
      food_percentage = food_percentage.to_i
      puts "COGS: #{food_percentage}%".colorize(:green).bold

      5.times do puts " " end
  end




end #end of class
