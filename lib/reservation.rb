#require_relative ""

#defining the reservation class
class Reservation
  attr_accessor :name, :phone, :notes
  def initialize(time, name, phone, notes)
    @time = time
    @name = name
    @phone = phone
    @notes = notes
  end


end
