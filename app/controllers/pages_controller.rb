class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def tests
  end
end
