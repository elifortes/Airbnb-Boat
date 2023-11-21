class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[home test nktest components]
  def home
    @user = current_user
  end

  def tests
  end

  def nktest
  end

  def components
  end
end
