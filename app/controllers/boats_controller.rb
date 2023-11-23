class BoatsController < ApplicationController
  # before_action :authorize_user! # , only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_boat, only: %i[show edit update destroy]

  def index
    @boats = Boat.all

    if params[:query].present?
      @boats = @boats.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @booking = Booking.new(boat: @boat)
    @markers = [
      {
        lat: @boat.latitude,
        lng: @boat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {boat: @boat}),
        marker_html: render_to_string(partial: "marker", locals: {boat: @boat})
        }
    ]
  end

  def new
    @boat = Boat.new
    @boats = current_user.boats
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

    @boat = Boat.find(params[:id])
    @boats = current_user.boats

  end

  def update

    @boat.update(boat_params)
    redirect_to edit_boat_path(@boat)
  end

  def destroy
    if @boat.destroy
      redirect_to boats_path, notice: 'Boat ad was successfully deleted.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:title, :description, :price_per_unit, :reviews, :captain_name, :guest_capacity,
                                  :availability_from, :availability_to, :boat_maker_name, :boat_model, :boat_size,
                                    :year_made, :location,:photo, photos: [])
  end
end
