class FavoritesController < ApplicationController

  # before_action :authenticate_user!, only: [ :index]   # ログイン中のユーザーのみに許可


  def index
    if current_user.nil?
      # ログインしていない場合の処理
      redirect_to recipes_path
    else
    # ログインユーザーがお気に入りに登録されているレシピを全て取得
      @favorite_recipes = current_user.favorites.map(&:recipe)
    end
  end

  # お気に入り登録


  def create
    if current_user.nil?
      # ログインしていない場合の処理
      redirect_to recipes_path
    else
      @favorite = current_user.favorites.build(favorite_params)
      @recipe = @favorite.recipe
      if @favorite.valid?
        @favorite.save
        redirect_to recipe_path(@recipe)
      end
    end
  end

  # # お気に入り削除

  def destroy
    if current_user.nil?
      # ログインしていない場合の処理
      redirect_to recipes_path # レシピ一覧画面にリダイレクト
    else
      @favorite = Favorite.find(params[:id])
      @recipe = @favorite.recipe
      if @favorite.destroy
        redirect_to recipe_path(@recipe)
      else
        redirect_to recipes_path
      end
    end
  end


  private
    def favorite_params
      params.permit(:recipe_id)
  end

end
