class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
      flash[:alert] = "你的購物車內已有此物品"
    end
    redirect_to product_path(params[:id])
  end
  
  def remove_from_cart
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

end
