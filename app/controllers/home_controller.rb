class HomeController < ApplicationController
  def index
    redirect_to user_path(id: current_user.name) if current_user
  end
end
