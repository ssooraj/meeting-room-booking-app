module RoomsHelper
  def book_room_button room_id
    link_to "Book Room", new_booking_path(room_id: room_id), method: 'get', class: 'btn btn-default btn-xs', role: 'group'
  end

  def delete_room_button
    button_to "Delete Room", room_path(@room.id), method: 'get', class: 'btn btn-default btn-xs', role: 'group'
  end

  def new_room_link
  	link_to "New Room", new_room_path, method: 'get'
  end
end
