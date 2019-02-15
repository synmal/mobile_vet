class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  def signed_in?
    session[:user_id]
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end

  def require_login
    if !signed_in?
      redirect_to root_path
      flash[:error] = 'Log in to continue'
    end
  end
end
