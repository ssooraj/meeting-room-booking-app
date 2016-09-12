class BookingsController < ApplicationController

  def show
    @booking = Booking.find_by_id(params[:id])
  end

  def new
    @room = Room.find_by_id(params[:room_id])
    @booking = @room.bookings.new
  end

  def create
    @booking = current_user.bookings.new(bookings_params)
    if @booking.save
      redirect_to @booking
    else
      @room = Room.find_by_id(bookings_params[:room_id])
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find_by_id(params[:id])
    if @booking.destroy 
      redirect_to rooms_path
    else
      render 'show'
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:room_id, :start_time, :end_time)
  end
end
