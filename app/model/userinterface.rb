class UserInterface

  def self.welcome
    puts Artii::Base.new.asciify "Welcome"
    puts Artii::Base.new.asciify "  to"
    puts Artii::Base.new.asciify "TastyGreens"
    puts "How may I assist you".colorize(:green).bold
  end

  def self.user_options
    puts "1. Place an order"
    puts "2. Check past orders"
  end

  def self.menu
    counter = 0
    Salad.all.each do |each_salad|
      counter += 1
      calories = each_salad.calculate_calories
     puts  "#{counter}. #{each_salad.name}, $#{each_salad.price}, #{calories} calories".colorize(:yellow)
    end
  end

  def self.create_order
    new_order = Order.create
    a = Salad.salad_options
    user_input2 = 1
    while user_input2 == 1 do
      self.menu
      puts "Please choose an option!"

      user_input = gets.chomp
      user_input = user_input.to_i
      a.each_with_index do |salad_instance, index|
        if user_input == (index + 1)
          OrderSalad.create(salad_id: salad_instance.id, order_id: new_order.id)
          ordertotal = new_order.update_total_price
          new_order.update(total: ordertotal)
        end
      end
      puts "Would you like to add another salad?"
      puts "Press 1 for yes, 2 for no"
      user_input2 = gets.chomp.to_i
    end
    Order.update_all_order_prices
    Customer.update_total_spend
    Customer.update_number_of_visits
    new_order
  end

  def self.choose_store
    a = Store.store_array
    a.each_with_index do |each_store, index|
      puts "#{index + 1}. #{each_store.name}, #{each_store.location}".colorize(:green).bold
    end
    begin
      puts "Please choose a store".colorize(:green).bold
      user_input = gets.chomp.to_i
    end while user_input > a.length
    user_input -= 1
    puts
    puts
    puts
    puts
    a[user_input]
  end

  def self.add_customer_to_order
    begin
      begin
        puts "Please choose an option".colorize(:green).bold
        puts "1. New Customer".colorize(:green).bold
        puts "2. Existing Customer".colorize(:green).bold
        user_input = gets.chomp.to_i
      end while user_input > 2
        puts "Please enter your name".colorize(:green).bold
        user_name = gets.chomp
        if user_input == 1
          customer = Customer.create(name: user_name)
        elsif user_input == 2
          customer = Customer.get_customer_info(user_name)
        end
      end while customer == nil
      customer
  end

  def self.activate
    self.welcome
    self.user_options
    user_input = gets.chomp.to_i
    if user_input == 1
      store_instance = self.choose_store
      order = self.create_order
      order.update(store_id: store_instance.id)
      customer_instance = self.add_customer_to_order
      order.update(customer_id: customer_instance.id)
      Order.update_all_order_prices
      Customer.update_total_spend
      Customer.update_number_of_visits
      order.display_order_summary
      puts "Thank you #{customer_instance.name}!".colorize(:green).bold
      puts "Press and enter any key to return to main menu".colorize(:red).bold
      gets
      puts
      puts
      puts
      puts
    elsif user_input == 2
      puts "Please enter your name".colorize(:green).bold
      user_name = gets.chomp
      customer = Customer.get_customer_info(user_name)
      if customer == nil
        puts "Sorry, that name was not found".colorize(:red).bold
      else
        customer.orders.each do |each_order|
          puts "Order ID: #{each_order.id}".colorize(:green).bold
          each_order.salads.each do |each_salad|
            puts "      #{each_salad.name}, $#{each_salad.price}".colorize(:yellow)
          end
          puts "Order Total: #{each_order.total}".colorize(:green).bold
          puts
          puts
          puts "Press and enter any key to return to main menu".colorize(:red).bold
          gets
        end
      end
    end
  end

end #end of class
