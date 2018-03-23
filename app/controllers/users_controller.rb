class UsersController < ApplicationController
  def new
  end

  def edit
    @user = User.new
    @user.id = 1
    @user.name = 'Valaki'
    @user.email = 'valaki@mail.bme.hu'
  end

  def forgotten
  end

  def show
    @user = User.new
    @user.id = 1
    @user.name = 'Valaki'
    @user.email = 'valaki@mail.bme.hu'
  end
end
