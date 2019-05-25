class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # This line makes these available to views as application controller methods are not by default
  #(but are available to the other controllers)
  helper_method :current_user, :logged_in?


  def current_user
  	# Return user ID if the current session has stored one (i.e. is logged in)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #!! converts to boolean
  def logged_in?
    !!current_user
  end

  #Obvious
  def require_user
    if !logged_in?
      flash[:danger] = "Action denied, please log in!"
      redirect_to root_path
    end
  end

end
