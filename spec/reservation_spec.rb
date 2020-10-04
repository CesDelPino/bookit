require_relative '../lib/reservation'

describe Reservation do
  it "Should isntanciate data" do
    sample_booking = Reservation.new('12','Jenny', "0423320070", 'nil')
    expect (sample_booking.notes) == ('nil')
    expect (sample_booking.name) == ('Jenny')
  end
end

