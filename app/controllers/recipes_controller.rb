class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :download]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = paginate(Recipe.all, params[:page])
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(name: recipe_params[:name], category: recipe_params[:category], ingredients: recipe_params[:ingredients], description: recipe_params[:description])
    @recipe.owner = @current_user

    respond_to do |format|
      if @recipe.save
        unless params[:recipe][:attachment].nil?
          Attachment.save_file params[:recipe][:attachment], @recipe
        end
        format.html {redirect_to @recipe, notice: 'Recipe was successfully created.'}
        format.json {render :show, status: :created, location: @recipe}
      else
        format.html {render :new}
        format.json {render json: @recipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(name: recipe_params[:name], category: recipe_params[:category], ingredients: recipe_params[:ingredients], description: recipe_params[:description])
        unless params[:recipe][:attachment].nil?
          Attachment.save_file params[:recipe][:attachment], @recipe
        end
        format.html {redirect_to @recipe, notice: 'Recipe was successfully updated.'}
        format.json {render :show, status: :ok, location: @recipe}
      else
        format.html {render :edit}
        format.json {render json: @recipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html {redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def download
    a = Attachment.find params[:aid]
    send_file a.path, type: a.mime, disposition: :inline
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def paginate(recipes,page)
    recipes.paginate(page: page, per_page: 5)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :category, :ingredients, :description)
  end
end
