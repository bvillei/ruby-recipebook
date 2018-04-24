class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show] # except: [:new, :create, :forgotten, :send_forgotten]
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: user_params[:name], password: user_params[:password], email: user_params[:email], password_confirmation: user_params[:password_confirmation])
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
    @user.update(name: user_params[:name], email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    redirect_to action: :show
  end

  def forgotten
  end

  def show
  end

  private
  def find_user
    @user = User.find params[:id]#session[:user]
  end

  def user_params
    params.require(:user).permit([:name, :password, :email, :password_confirmation])
  end
end
