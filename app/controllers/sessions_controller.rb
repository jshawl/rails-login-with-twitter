class SessionsController < ApplicationController
  def create
    @user = User.from_auth(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end
  def auth_hash
    request.env['omniauth.auth']
  end
end