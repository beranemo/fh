class OrdersController < ApplicationController

  def index
    render plain: "訂單已成立"
  end
  
  def create
    if current_user
      @order = current_user.orders.new(order_params)
    else
      @order = Order.new(order_params)
      @order.user_id = -1 # 如果使用者沒有加入會員的話
    end
  
    @order.sn = Time.now.to_i
    @order.add_order_items(current_cart)
    @order.amount = current_cart.total
    if @order.save
      current_cart.destroy
      redirect_to orders_path, notice: "訂單已成立"
    else
      @items = current_cart.cart_items
      render "carts/show"
    end  
    
  end
  
  private
  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method)
  end

end
