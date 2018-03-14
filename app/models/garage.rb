class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :break_categories, dependent: :destroy

end
