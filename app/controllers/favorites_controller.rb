class FavoritesController < ApplicationController
  before_action :redirect_to_root_path, only: %i(index create destroy)

  def index
    @favorite_recipes = current_user.favorites.map(&:recipe)
  end

  # お気に入り登録
  def create
    @favorite = current_user.favorites.build(favorite_params)
    @recipe = @favorite.recipe
    if @favorite.valid?
      @favorite.save
      redirect_to recipe_path(@recipe)
    end
  end

  # お気に入り削除
  def destroy
    @favorite = Favorite.find(params[:id])
    @recipe = @favorite.recipe
    if @favorite.destroy
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipes_path
    end
  end

  private
  
  def favorite_params
    params.permit(:recipe_id)
  end

  def redirect_to_root_path
    redirect_to root_path if !current_user
  end
end
