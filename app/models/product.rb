class Product < ApplicationRecord
  validates :title, presence: true # 輸入的項目不能為空
  mount_uploader :image, PhotoUploader
end
