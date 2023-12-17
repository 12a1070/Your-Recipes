class FavoritesController < ApplicationController

  before_action :authenticate_user!   # ログイン中のユーザーのみに許可


  def index
    # ログインユーザーがお気に入りに登録されているレシピを全て取得
    @favorite_recipes = current_user.favorites.map(&:recipe)
  end

  # お気に入り登録
  def create
    @favorite = current_user.favorites.build(favorite_params)
# favoriteはmodelのfavoritesに従う
    @recipe = @favorite.recipe
    if @favorite.valid?
      @favorite.save
      redirect_to recipe_path(@recipe)
    else
      # エラー処理
      redirect_to recipes_path # レシピ一覧画面にリダイレクト
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

end
