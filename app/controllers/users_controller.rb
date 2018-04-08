class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show] # except: [:new, :create, :forgotten, :send_forgotten]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      flash[:notice] = "Successful registration"
      redirect_to welcome_path
    else
      flash[:notice] = "Email address in use or password do not match"
      redirect_back(fallback_location: register_path)
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_back
  end

  def forgotten
  end

  def show
  end

  private
  def find_user
    @user = User.find session[:user]
  end

  def user_params
    params.require(:user).permit([:name, :password, :email, :password_confirmation])
  end
end
