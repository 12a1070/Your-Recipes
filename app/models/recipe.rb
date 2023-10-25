class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :material, presence: true
  validates :process, presence: true
end
