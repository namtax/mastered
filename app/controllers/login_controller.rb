class LoginController < ApplicationController
  def create
    opts    = { username: params[:username], password: params[:password], session: session }
    outcome = LoginUserService.run(opts)

    if outcome.valid? && outcome.result
      redirect_to user_path(id: current_user.name)
    else
      flash.now[:warning] = 'Please supply valid login credentials'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
