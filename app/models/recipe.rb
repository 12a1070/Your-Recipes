class Recipe < ApplicationRecord
  belongs_to :user,dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true

end
