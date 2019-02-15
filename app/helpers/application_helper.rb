module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-danger"
    end
  end

  def signed_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
