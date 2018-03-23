class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    # @recipes = Recipe.all
    recipe1 = Recipe.new
    recipe1.id  = 1
    recipe1.user = User.new name: 'Valaki', id: 1
    recipe1.name = 'Fishsoup'
    recipe1.category = 'Soup'
    recipe1.image = 'No image'
    recipe1.ingredients = 'Fish, Soup'
    recipe1.description = 'Take the fish into the soup'

    recipe2 = Recipe.new
    recipe2.id = 2
    recipe2.user = User.new name: 'Mas valaki', id: 2
    recipe2.name = 'Chocolate'
    recipe2.category = 'Dessert'
    recipe2.image = 'No image'
    recipe2.ingredients = 'Chocolate bar'
    recipe2.description = 'Open the chocolate bar and eat it'

    @recipes = [ recipe1, recipe2 ]
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
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:user_id, :name, :category, :image, :ingredients, :description)
    end
end
