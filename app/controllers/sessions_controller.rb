class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.active.find_by_username(params[:email])
    if user && user.authenticate(params[:password])
      create_cart
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash[:error] = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    destroy_cart
    redirect_to login_path, notice: "Logged out!"
  end
end