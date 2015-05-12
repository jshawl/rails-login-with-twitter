class SessionsController < ApplicationController
  def index
  end
  def create
    @user = User.from_auth(auth_hash)
    binding.pry
    session[:user_id] = @user.id
    redirect_to '/'
  end
  def auth_hash
    request.env['omniauth.auth']
  end
end