class ApplicationController < ActionController::Base
  
  helper_method :current_cart
  
  def current_cart
    
    if @cart.present?
      return @cart      
    end
    
    cart = Cart.find_by(id: session[:cart_id])
    
    unless cart.present?
      cart = Cart.create
    end
    
    session[:cart_id] = cart.id
    
    @cart = cart
    
    @cart
  end
end
