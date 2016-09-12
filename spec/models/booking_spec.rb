require 'rails_helper'

RSpec.describe Booking, type: :model do
   it "returns a room next booking as a string" do
   	user = User.create!(email: 'john@yopmail.com',first_name: 'John', last_name: 'Doe', password: 'password', role_id: 1)
    room = Room.create!( name: "My Room", capacity: 10 )
    booking = user.bookings.new(room_id: room.id)
    expect(booking.booked_by).to eq "John Doe"
  end

  it "returns a room availability as a string" do
    room = Room.create!(name: "My Room", capacity: 10)
    expect(room.is_available_now).to be_in(['Available', 'Not Available'])
  end
end
