class BookingsController < ApplicationController
  # before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @boat = Boat.find(params[:id])
    @bookings = @boat.bookings
  end


  def new
    @booking = Booking.new
    # @boats = Boat.all
  end

  def create
    @booking = Booking.new(booking_params)
    # @booking.user = current_user
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      @boats = Boat.all
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(@booking.user), notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:boat_id, :user_id, :status, :start_date, :end_date, :total_price)
  end

  # def authorize_user!
  #   redirect_to root_path, unless @booking.user == current_user
  # end

end
