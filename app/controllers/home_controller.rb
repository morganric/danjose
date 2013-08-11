class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def goodbye
  end
end
