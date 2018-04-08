class SessionsController < ApplicationController
  def create
    @user = User.authenticate params[:email], params[:password]
    if @user
      flash[:notice] = "Logged in successfully"
      session[:user] = @user.id
      #redirect_to :back
      redirect_back(fallback_location: welcome_path)
    else
      flash[:notice] = "Invalid email address or password"
      #redirect_to :back
      redirect_back(fallback_location: welcome_path)
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Logged out successfully"
    redirect_to welcome_path
  end
end
