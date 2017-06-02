class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end
  
  def create
    employee = Employee.find_by_email(params[:email])
    if employee && employee.authenticate(params[:password])
      if session[:employee_id].nil?
        session[:employee_id] = employee.id
      end
      redirect_to home_path, notice: "Logged in!"
    else
      flash[:error] = "Email or password is invalid"
      redirect_to login_path
    end
  end
  
  def destroy
    session[:employee_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

end