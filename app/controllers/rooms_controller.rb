class RoomsController < ApplicationController
  before_action :set_q

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
    flash[:notice] = "新規で宿泊施設を登録をしました"
    redirect_to room_path(@room)
    else
    render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def posts
    @user = current_user
    @rooms = @user.rooms
  end
  
  def search
    @results = @q.result
    @results_cnt = @results.count
  end
  
end
