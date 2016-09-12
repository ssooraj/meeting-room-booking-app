require 'rails_helper'

RSpec.describe Room, type: :model do
  it "returns a room next booking as a string" do
    room = Room.create(name: "My Room", capacity: 10)
    expect(room.next_booking).to eq "Not booked"
  end
end
