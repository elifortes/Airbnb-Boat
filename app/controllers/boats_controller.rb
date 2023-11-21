class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new(boat: @boat)
  end

  def new
    @boat = Boat.new
  end

  def create
    @user = current_user
    @boat = Boat.new(boat_params)
    @boat.user = @user
    if @boat.save
      redirect_to boats_path, notice: 'Boat ad was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :description, :price_per_unit, :reviews, :captain_name, :guest_capacity, :availability_from, :availability_to, :boat_maker_name, :boat_model, :boat_size, :year_made, :photo, photos: [])
  end
end
