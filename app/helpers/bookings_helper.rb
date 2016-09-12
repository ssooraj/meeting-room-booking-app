module BookingsHelper

  def delete_booking(booking_id)
    link_to "Delete Booking", booking_path(booking_id), method: 'delete', class: 'btn btn-default btn-xs', role: 'group'
  end

  def admin_or_booking_by_current_user(booking)
  	( current_user.is_admin? or booking.user == current_user) ? true : false
  end
end
