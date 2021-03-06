# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  
  def subtotal
    if self.quantity != nil and self.quantity != ""
      self.quantity * self.product.price
    else
      self.product.price
    end
  end

end
