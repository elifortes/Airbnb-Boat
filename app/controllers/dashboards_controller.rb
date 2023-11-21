class DashboardsController < ApplicationController
  def index
    @user = current_user
    @boats = current_user.boats
    @bookings = current_user.bookings
    # looking for the entry belongs to user and not his booking
    # look for his boats booking


    @pending = []
    @boats.each do |bb|
      @pending += bb.bookings.reject { |b| b.user_id == current_user.id }
    array = @boats.each do |bb|
      @pending += bb.bookings #where { |b| b.user_id != (current_user.id) }
    end

  end
end
