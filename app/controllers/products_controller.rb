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
    # redirect_back(fallback_location: root_path)
  end
  
  def adjust_item
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    if params[:type] == "add"
      cart_item.quantity += 1
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    end
     if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.save
    end
    # redirect_back(fallback_location: root_path)
  end


end
