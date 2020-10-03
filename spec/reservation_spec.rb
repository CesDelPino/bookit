require_relative '../lib/reservation'

describe Reservation do
  it "Should isntanciate data" do
    sample_booking = Reservation.new('12','Jenny', "0400320070", 'taking grandma')
    expect (sample_booking.name).to_eq 'Jenny'
    expect (sample_booking).to be an_instance_of Reservation
  end
end