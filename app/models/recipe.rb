class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true

  def self.looks(word)
# タイトルのカラムに含まれる単語を表示
    where("title LIKE?","%#{word}%")
  end

end
