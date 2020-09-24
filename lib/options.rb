 class OpeningOptions
  
  def selection
    choice = gets.chomp
  end
 

  def show_options
    puts "Please select from the following options"
    puts "to see todays availability select 1"
    puts "to make a booking for today select 2"
    puts "to modify of cancel a booking select 3"
    puts "to display all bookings select 4"
    print "-->"
  end



  def openining_choice
    loop do
      show_options
      case selection
      when "1"
        puts "Lets see the availability"
        exit
      when "2"
        puts "lets make a booking"
        exit
      when "3"
        puts "lets modify/cancel"
      when "4"
        puts "display all bookings"
      else 
        "puts invalid selection"
      end
    end
  end
end

