class RoomsController < ApplicationController

  def index
    @rooms = Room.paginate(page: params[:page], per_page: 10)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :capacity)
  end

end
