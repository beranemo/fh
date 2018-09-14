class CartsController < ApplicationController
  def add
    current_cart.add_item(params[:id])

    redirect_to product_path(params[:id]), notice: "已加入購物車"
  end
  
  def show
    @cart = current_cart
    @items = current_cart.cart_items
  end

end
