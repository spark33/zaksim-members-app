class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  helper_method :current_user

  def logged_in?
    current_user
  end
  helper_method :logged_in?

  def check_login
    if current_user.nil?
      flash[:error] = "You need to log in to view this page."
      redirect_to login_url
    end
  end
end
