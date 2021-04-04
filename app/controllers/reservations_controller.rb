class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:start_date, :end_date, :person_number, :room_id))
    @use_duration = (@reservation.end_date - @reservation.start_date).to_int
    @reservation.total_price = @reservation.person_number * @use_duration * @reservation.room.price
  end
  
  def show
    @reservation = Reservation.find(params[:id])

  end
  
  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:start_date, :end_date, :person_number, :room_id, :total_price))
    if @reservation.save
    flash[:notice] = "新規で宿泊を予約しました"
    redirect_to reservation_path(@reservation)
    else
    flash[:notice] = "宿泊の予約に失敗しました"
    redirect_to root_path
    end
  end
  
end
