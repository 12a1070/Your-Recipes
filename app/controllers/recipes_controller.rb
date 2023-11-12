class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to_recipes_path
    else
      flash.now[:notice]= '項目を埋めてください'
      render 'edit'
    end
  end

  def  destroy
    recipe = Recipe.find(params[:id])
    if recipe.user_id == current_user.id
      @recipe.destroy
      redirect_to recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:photo, :title, :material, :process, :cooking_minute).
    merge(user_id: current_user.id, id: params[:recipe_id])
  end

end
