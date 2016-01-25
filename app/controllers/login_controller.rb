class LoginController < ApplicationController
  def create
    opts    = { username: params[:username], password: params[:password], session: session }
    outcome = LoginUserService.run(opts)

    if outcome.valid? && outcome.result
      redirect_to '/users'
    else
      flash[:warning] = 'Please supply valid login credentials'
      render action: 'new'
    end
  end
end
