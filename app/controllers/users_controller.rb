class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = current_user.users_to_follow
  end

  def show
    @user      = User.find_by(name: params[:id])
    @activity  = FetchActivityService.run(user: @user).result
  end

  def follow
    you     = User.find_by(name: params[:id])
    them    = User.find(params[:user_id])
    outcome = FollowUserService.run(user: them, follower: you)

    if outcome.valid?
      flash[:success] = "You are now following #{them.name}"
      redirect_to action: 'index'
    end
  end
end
