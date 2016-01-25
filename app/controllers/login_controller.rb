class LoginController < ApplicationController
  def create
    opts    = { username: params[:username], password: params[:password], session: session }
    outcome = LoginUserService.run(opts)

    if outcome.valid? && outcome.result
      redirect_to user_path(id: current_user.name)
    else
      flash[:warning] = 'Please supply valid login credentials'
      render action: 'new'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
