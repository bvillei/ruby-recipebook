module ApplicationHelper
  def logged_in?
    session[:user]
  end

  def recipe_owner?
    @recipe.owner == @current_user
  end
end
