class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy # master 刪掉的話，detail 也會跟著刪除
  has_many :items, through: :cart_items, source: :product
end
