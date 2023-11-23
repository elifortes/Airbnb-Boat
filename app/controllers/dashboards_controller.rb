class DashboardsController < ApplicationController
  def index
    @user = current_user
    @boats = current_user.boats
    @boat = Boat.all.sample
    @bookings = current_user.bookings.order(start_date: :asc)
    # looking for the entry belongs to user and not his booking
    # look for his boats booking
    @dnone = @boats.empty? ? 'd-none' : ''
    @pending = []
    @boats.each do |bb|
      @pending += bb.bookings.reject { |b| b.user_id == current_user.id }
    end
    @pending.sort_by { |p| p.start_date }
    @open = @pending.select { |o| o.status == 'pending' }
    @open = @open.length.to_i
    @percentage = @open / @pending.length.to_f * 100 unless @pending.length == 0
  end

  def clientbookings
    @user = current_user
    @bookings = current_user.bookings.order(start_date: :asc)
  end

  def clientrequests
    @user = current_user
    @boats = current_user.boats

    @pendings = []
    @boats.each do |bb|
      @pendings += bb.bookings.reject { |b| b.user_id == current_user.id }
    end
    @pendings.sort { |p| p.start_date }
    @open = @pendings.select { |o| o.status == 'pending' }
    @percentage = (Float(@open.length - @bookings.length) / @open.length * 100).ceil unless @open
  end
end
