class Order < ApplicationRecord
  validates :name, presence: true # 輸入的項目不能為空
  validates :address, presence: true # 輸入的項目不能為空
  validates :phone, presence: true # 輸入的項目不能為空
  
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

end
