class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params.dig(:session, :email).downcase)
    if user&& user.authenticate(params.dig(:session, :password))
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination. Please check it again'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
