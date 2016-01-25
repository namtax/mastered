class LoginUserService < ActiveInteraction::Base
  model :session, class: ActionDispatch::Request::Session
  string :username
  string :password

  def execute
    session[:user_id] = user.id
  end

  def user
    User.find_by(name: username, password: password) || User.new
  end
end