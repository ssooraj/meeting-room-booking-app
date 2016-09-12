class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validate :if_in_the_past
  validate :if_end_smaller_than_start
  validate :check_if_booking_exists

  def booked_by
    user.full_name
  end

  def booked_time
    start_time_formatted + ' to ' + end_time_formatted
  end

  def start_time_formatted
    "#{start_time.strftime('%m-%d-%Y %H:%M')}"
  end

  def end_time_formatted
    "#{end_time.strftime('%m-%d-%Y %H:%M')}"
  end

  private

  def check_if_booking_exists
    booking = Booking.where('(
                          ( start_time >= ? AND end_time <= ? ) OR
                          ( start_time <= ? AND end_time >= ? ) OR
                          ( start_time <= ? AND end_time <= ? AND end_time >= ? ) OR
                          ( start_time >= ? AND end_time >= ? AND start_time <= ? )) 
                          AND room_id = ?',
                            self.start_time, self.end_time,
                            self.start_time, self.end_time,
                            self.start_time, self.end_time, self.start_time,
                            self.start_time, self.end_time, self.end_time,
                            self.room_id)
    unless booking.blank?
      errors.add(:booking, 'exists in the time span')
    end
  end

  def if_end_smaller_than_start
    if self.end_time <= self.start_time
      errors.add(:booking, 'end time should be after start time')
    end
  end

  def if_in_the_past
    if self.start_time <= Time.now
      errors.add(:booking, 'cannot be made in the past')
    end
  end
end
