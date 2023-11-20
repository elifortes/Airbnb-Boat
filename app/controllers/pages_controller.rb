class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def tests
  end

  def nktest
  end
end
