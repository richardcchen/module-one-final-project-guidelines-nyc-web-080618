class UserInterface

  def self.welcome
    puts "Welcome to TastyGreen's! How may I assist you"
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
     puts  "#{counter}. #{each_salad.name}, $#{each_salad.price}, #{calories} calories"
    end
  end

  def self.create_order
    new_order = Order.create
    a = Salad.salad_options
    user_input2 = 1
    while user_input2 == 1 do
      self.menu
      puts ""
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
    new_order.display_order_summary
    new_order
  end

  def self.choose_store
    user_input = 99999999
    puts "Please choose a store"
    a = Store.store_array
    a.each_with_index do |each_store, index|
      puts "#{index + 1}. #{each_store.name}, #{each_store.location}"
    end
    while user_input > a.length do
      user_input = gets.chomp.to_i
    end
    user_input -= 1
    a[user_input]
  end


  def self.activate
    self.welcome
    self.user_options
    user_input = gets.chomp.to_i
    if user_input == 1
      store_instance = self.choose_store
      order = self.create_order
      order.update(store_id: store_instance.id)
    elsif user_input == 2

    end
  end

end #end of class
