class BookingsController < ApplicationController
  before_action :authorize_user! # , only: [:edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @boat = @booking.boat
  end

  def new
    @boat = Boat.find(params[:boat_id])
    # @booking = Booking.new(boat_id: @boat.id)
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_confirmation_path
      # redirect_to boat_booking_path(@boat, @booking)
    else
      render :new
    end
  end



  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboards_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end


  def confirmation
    @booking = Booking.last
    @boat = Boat.find(@booking.boat_id)
    @total_days = (@booking.end_date - @booking.start_date)
    @total_price = @total_days * @boat.price_per_unit
    @booking.save!
  end


  # def destroy
  #   @booking.destroy
  #   redirect_to user_path(@booking.user), notice: 'Booking was successfully destroyed.'
  # end

  # def calculate_total_price
  #   if start_date.present? && end_date.present?
  #     (end_date - start_date).to_i * boat.price_per_unit
  #   else
  #     0
  #   end
  # end

  private

  def booking_params
    params.require(:booking).permit(:boat_id, :user_id, :status, :start_date, :end_date, :total_price)
  end

  # def authorize_user!
  #   redirect_to root_path, unless @booking.user == current_user
  # end
end
