class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true


end
