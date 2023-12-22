class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy #レシピ削除されたらお気に入りも解除
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true

  def favorited_by(user)
    Favorite.find_by(user_id: user.id, recipe_id: id)
  end

  def self.looks(word)
# タイトルのカラムに含まれる単語を表示
    where("title LIKE?","%#{word}%")
  end

end
