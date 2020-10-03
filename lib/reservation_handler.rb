require 'json'
require 'terminal-table'

class ReservationHandler
  attr_reader :open_slots
  def initialize
    find_bookings
  end

  def find_bookings
    confirmed_bookings = File.read(Dir.pwd + '/lib/DATABASE.json')
    @bookings = JSON.parse(confirmed_bookings)
  end

  def say(param)
    `say #{param}`
  end

  def find_open_times
    @open_slots = []
    @bookings.each do |booking|
      @open_slots << booking['time'] if booking.value?('open')
    end
  end

  def free_times_printer
    find_open_times
    puts 'These time slots are open today'.colorize(:light_blue)
    @open_slots.each do |time|
      puts "#{time}:00 is free"
    end
  end


  def display_all
    rows = []
    @bookings.each do |booking|
      new_row = [booking['time'], booking['name'], booking['phone'], booking['notes']]
      rows << new_row
    end
    table = Terminal::Table.new :title => "Todays Bookings", :headings => ['Time', 'Name', 'Phone', 'Notes'], :rows => rows
    puts table
  end

  def find_index(hour)
    @bookings.index do |booking|
      booking['time'] == hour
    end
  end

  def slot_checker
    puts 'what time would you like to book?'.colorize(:yellow).colorize(background: :blue)
    time = select_time
    if @open_slots.include?(time)
      make_booking(time)
    else
      puts 'that time is not available'.colorize(:yellow).colorize(background: :red)
      say('Error, that time is not available')
    end
  end

  def make_booking(time)
    index = find_index(time)
    last = PROMPT.collect do
      key('name').ask('What is the reservation name?'.colorize(:yellow).colorize(background: :blue))
      key('phone').ask('Contact number?'.colorize(:yellow).colorize(background: :blue))
      key('notes').ask('Special requirements?'.colorize(:yellow).colorize(background: :blue))
    end
    user_input = { 'time' => time }.merge(last)
    @bookings[index] = user_input
  end

  def select_time
    times = %w[12 13 14 15 16 17 18 19 20 21]
    PROMPT.select('Select the booking'.colorize(:red), times)
  end

  # def select_time
  #   open = @open_slots
  #   PROMPT.select("Select the booking", open)
  # end

  def delete_booking
    time = select_time
    index = find_index(time)
    info = { 'time' => time, 'name' => 'open', 'phone' => 'nil', 'notes' => 'nil' }
    puts "The booking for #{@bookings[index]['name']} has been deleted".colorize(:red)
    @bookings[index] = info
    say('booking deleted')
  end

  def save_changes
    File.write(Dir.pwd + '/lib/DATABASE.json', JSON.pretty_generate(@bookings))
    say('all changes, saved')
  end
end
