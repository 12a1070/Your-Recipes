class FavoritesController < ApplicationController

  before_action :set_recipe
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可

#お気に入りレシピ一覧

  # お気に入り登録
  def create
    @favorite = current_user.favorite.build(favorite_params)
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
    end
  end

  private
    def favorite_params
      params.permit(:recipe_id)
    end

end
