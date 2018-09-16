class ApplicationController < ActionController::Base
  
  helper_method :current_cart
  helper_method :current_user
  
  def current_user
    nil
  end
  
  def current_cart
    if @cart.present?
      return @cart      
    end
    
    cart = Cart.find_by(id: session[:cart_id])
    puts "=============="
    puts "找到購物車"
    unless cart.present?
      cart = Cart.create
      puts "新增購物車"
    end
    
    session[:cart_id] = cart.id
    
    @cart = cart
    
    @cart
  end
end
