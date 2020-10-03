#require_relative ""

#defining the reservation class
path = File.dirname(__FILE__).split("/")
path.pop
DATABASE = "#{path.join("/")}/lib/DATABASE.json"

class Reservation
  attr_reader :name, :phone, :notes

  def initialize(time, name, phone, notes)
    @time = time
    @name = name
    @phone = phone
    @notes = notes
  end


end
