class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'Successfully logged in.'
    else
      redirect_to new_session_path
      flash[:error] = 'Invalid login credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = 'Successfully logged out'
  end
end
