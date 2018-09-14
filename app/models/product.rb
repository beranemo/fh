# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :decimal(, )      default(0.0)
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  validates :title, presence: true # 輸入的項目不能為空
  mount_uploader :image, PhotoUploader
end
