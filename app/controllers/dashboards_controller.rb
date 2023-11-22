class DashboardsController < ApplicationController
  def index
    @user = current_user
    @boats = current_user.boats
    @bookings = current_user.bookings
    # looking for the entry belongs to user and not his booking
    # look for his boats booking
    @dnone = @boats.empty? ? 'd-none' : ''
    @pending = []
    @boats.each do |bb|
      @pending += bb.bookings.reject { |b| b.user_id == current_user.id }
    end
    @open = @pending.select { |o| o.status == 'pending' }
    @percentage = (Float(@open.length - @bookings.length) / @open.length * 100).ceil unless @bookings.empty?
  end
end
