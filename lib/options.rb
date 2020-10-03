require 'tty-prompt'
require_relative 'reservation'
require_relative 'reservation_handler'

class OpeningOptions
  def initialize
    @reservation = ReservationHandler.new
  end

  def menu
    PROMPT.select('Welcome to your bookings app'.colorize(:red)) do |menu|
      menu.choice({ name: 'See todays free slots', value: '1' })
      menu.choice({ name: 'Make a booking', value: '2' })
      menu.choice({ name: 'Modify a booking', value: '3' })
      menu.choice({ name: 'Delete a booking', value: '4' })
      menu.choice({ name: 'Display all bookings', value: '5' })
      menu.choice({ name: 'EXIT and SAVE changes', value: '6' })
    end
  end

  def opening_choice
    loop do
      case menu
      when '1'
        @reservation.free_times_printer
      when '2'
        @reservation.slot_checker
      when '3'
        @reservation.make_booking(@reservation.select_time)
      when '4'
        @reservation.delete_booking
      when '5'
        @reservation.display_all
      when '6'
        @reservation.save_changes
        exit
      end
    end
  end
end
