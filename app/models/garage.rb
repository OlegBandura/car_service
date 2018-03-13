class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  before_save do
    self.garage_types.gsub!(/[\[\]\'']/, "") if attribute_present?("garage_types")
  end
end
 
