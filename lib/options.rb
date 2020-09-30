require_relative "reservation"
require_relative "reservation_handler"

class OpeningOptions
  def initialize
    @reservation = ReservationHandler.new
  end

  def selection
    choice = gets.chomp
  end

  def show_options
    puts "\n"
    puts "   Please select from the following options    "
    puts "\n"
    puts "**>To see todays availability select 1".colorize(:green)
    puts "**>To make a booking for today select 2".colorize(:green)
    puts "**>To modify a booking select 3".colorize(:green)
    puts "**>To ".colorize(:green)+"DELETE".colorize(:red) + " a booking select 4".colorize(:green)
    puts "**>To display all bookings select 5".colorize(:green)
    puts "**>To EXIT and SAVE changes select 6".colorize(:green)
    print "-->"
  end

  def opening_choice
    loop do
      show_options
      case selection
      when "1"       
        @reservation.find_open_times
        @reservation.free_times_printer
      when "2"
        @reservation.find_open_times
        @reservation.slot_checker
      when "3" 
        @reservation.modify_booking
      when "4"
        @reservation.delete_booking
      when "5"
        @reservation.display_all
      when "6"
        @reservation.save_changes
        exit
      else 
        puts "invalid selection".colorize(:red)
      end
    end
  end

end

