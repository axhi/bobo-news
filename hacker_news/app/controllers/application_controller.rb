class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def is_logged_in?
    session[:user_id] != nil
  end
  helper_method :is_logged_in?

  def login_check
    if session[:user_id] == nil
      redirect_to new_user_path
      @errors = "Please Login"
    end
  end

end
