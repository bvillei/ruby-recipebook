class ApplicationController < ActionController::Base
  before_action :find_session
  protect_from_forgery with: :exception

  protected
  def find_session
    @current_user = User.find session[:user]
  end
end
