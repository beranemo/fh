# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  sn              :integer
#  amount          :integer
#  user_id         :integer
#  name            :string
#  phone           :string
#  address         :string
#  payment_status  :string           default("not_paid")
#  shipping_status :string           default("not_shipped")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ApplicationRecord
  validates :name, presence: true # 輸入的項目不能為空
  validates :address, presence: true # 輸入的項目不能為空
  validates :phone, presence: true # 輸入的項目不能為空
  
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  def add_order_items(cart)
    cart.cart_items.each do |item|
      self.order_items.build(
        product_id: item.product.id,
        quantity: item.quantity,
        price: item.product.price
      )
    end
  end

end
