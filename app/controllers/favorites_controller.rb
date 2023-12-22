class FavoritesController < ApplicationController

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
    # current_user.nil?
    redirect_to recipes_path unless current_user
    @favorite = current_user.favorites.build(favorite_params)
    @recipe = @favorite.recipe
      if @favorite.valid?
      @favorite.save
      redirect_to recipe_path(@recipe)
      end
  end

  # # お気に入り削除
  def destroy
    current_user.nil?
    # ログインしていない場合の処理
    redirect_to root_path unless current_user # レシピ一覧画面にリダイレクト
    #ログインされているならレシピ一覧へ遷移
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
