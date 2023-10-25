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
        redirect_to_index
      else
        flash.now[:alert]= '項目を埋めてください'
        render :new
      end
  end

end
