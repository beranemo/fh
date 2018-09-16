# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy # master 刪掉的話，detail 也會跟著刪除
  has_many :items, through: :cart_items, source: :product
  
#  def add_item(product_id)
#    found_item = self.items.find { |item| item.product_id == product_id }
#
#    if found_item
#      found_item.increment
#    else
#      items << CartItem.new(product_id)
#    end
#  end
  
  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.save
  end

  def total
    self.cart_items.map(&:subtotal).sum
  end

  def find_item_by(product)
    self.cart_items.where(product_id: product).first
  end

end
