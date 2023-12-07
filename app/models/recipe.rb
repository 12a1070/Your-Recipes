class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @recipe = Recipe.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("title LIKE?","%#{word}%")
    else
      @recipe = Recipe.all
    end
  end

end
