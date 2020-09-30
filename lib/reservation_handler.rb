require "json"

class ReservationHandler
  attr_reader :open_slots
    def initialize
      find_bookings 
    end

    def find_bookings
      confirmed_bookings = File.read(Dir.pwd + "/lib/DATABASE.json")
      @bookings = JSON.parse(confirmed_bookings)
    end

    def say(param)
      `say #{param}`
    end

    def find_open_times
      @open_slots = []
      @bookings.each do |booking|
          if booking.value?("open")
          @open_slots<<booking["time"]
          end
      end  
    end

    def free_times_printer
      puts "These time slots are open today".colorize(:light_blue)
      @open_slots.each do |time|
      puts "#{time}:00 is free"
      end
      say("These are the open slots")
    end
    
    def display_all
        puts "                      Todays bookings are:".colorize(:blue)
        puts "**************************************************************************".colorize(:yellow)
        @bookings.each do |booking|
          if booking["name"] != "open"
          puts "#{booking["time"]}:00 is booked by #{booking["name"]}, notes: #{booking["notes"]} ph: #{booking["phone"]} "
          else
            puts "#{booking["time"]}:00 hours is open"
          end
        end
        puts "**************************************************************************".colorize(:yellow)
        say("These are todays bookings")
    end

    def find_index(hour)
      @bookings.index do |hash| 
        hash["time"] == hour
      end
    end
    
    def slot_checker
      puts "what time would you like to book?".colorize(:yellow ).colorize(:background => :blue)
      time = gets.chomp
      if @open_slots.include?(time)
        make_booking(time)
      else
        puts "that time is not available".colorize(:yellow ).colorize(:background => :red)
        say("Error, that time is not available")
      end
    end


    def make_booking(time)
      index = find_index(time)
      info = {"time" => time}
      puts "What is the reservation name?".colorize(:yellow ).colorize(:background => :blue)
      print "-->"
      name = gets.chomp
      info.store("name", name)
      puts "what is the phone number".colorize(:yellow ).colorize(:background => :blue)
      print "-->"
      phone = gets.chomp
      info.store("phone", phone)
      puts "any special requirements?".colorize(:yellow ).colorize(:background => :blue)
      print "-->"
      requirements = gets.chomp
      info.store("notes", requirements)
      @bookings[index] = info
      say("booking saved")
    end

    def modify_booking
      puts "Which time to modify?"
      time = gets.chomp
      make_booking(time)
    end

    def delete_booking
      puts "Which time to delete?"
      time = gets.chomp
      index = find_index(time)
      info = {"time" => time, "name" => "open", "phone"=> "nil", "notes"=> "nil"}
      puts "The booking for #{@bookings[index]["name"]} has been deleted".colorize(:red)
      @bookings[index] = info
      say("booking deleted")
    end

    def save_changes
      File.write(Dir.pwd + "/lib/DATABASE.json", JSON.pretty_generate(@bookings))
      say("all changes, saved")
    end

end