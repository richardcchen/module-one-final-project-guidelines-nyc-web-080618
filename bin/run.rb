require_relative '../config/environment'

run = RunIt.new
run.up_to_date
run.welcome
input = 0
while input != 6 do
  run.main_screen_display
  input = gets.chomp
  input = input.to_i
  5.times do
    puts " "
  end
  if input == 1
    #binding.pry
    run.customer_display
    input = gets.chomp
    input = input.to_i
    RunIt.customer_options(input)
  elsif input == 2
    run.order_display
    input = gets.chomp
    input = input.to_i
    RunIt.order_options(input)
  elsif input == 3
    run.store_display
    input = gets.chomp
    input = input.to_i
    RunIt.store_options(input)
  elsif input == 4
    RunIt.company_options(input)
  elsif input == 5
    run.up_to_date
    puts "All information is up to date!"
  end #end of main screen options
end

#101
#Giant Bird the Hunter
#"Growlithe"
binding.pry
