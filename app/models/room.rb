class Room < ApplicationRecord
	has_many :bookings, dependent: :destroy

	def next_booking
		booking = upcoming_bookings.first if upcoming_bookings
		booking.present? ? booking.start_time_formatted : "Not booked"
	end

	def is_available_now
		bookings.where('start_time <= ? and end_time >= ?', Time.now, Time.now).blank? ? 'Available' : 'Not Available'
	end

	def upcoming_bookings
		booking = bookings.where('start_time > ?', Time.now).order('start_time')
	end
end
