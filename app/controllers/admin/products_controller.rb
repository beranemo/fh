class Admin::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      flash[:notice] = "商品資料已成功更新"
      redirect_to admin_products_path
    else
      render :index
    end
  end
  
   def product_params
    params.require(:product).permit(
      :title,
      :price,
      :image
      )
  end
  
end
