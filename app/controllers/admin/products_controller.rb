class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "商品已成功建立"
    else
      render :new
    end
  end
  
  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: "商品已成功更新"
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: "商品已移除"
  end
  
  private
  def set_product
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:title, :price, :image)
  end

  
end
