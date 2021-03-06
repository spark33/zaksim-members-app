class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Admin 계정이 필요한 액션 입니다."
    redirect_to home_path
  end

  private
    def trancate(string, length = 25)
      string.size > length+5 ? [string[0,length],string[-5,5]].join("...") : string
    end
    helper_method :trancate

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

    def format_string(s)
      s.gsub(/\n/,'<br/>')
    end
    helper_method :format_string
    
end
