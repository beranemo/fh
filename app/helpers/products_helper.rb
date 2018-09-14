module ProductsHelper
  def print_price(price)
    format("$%.0f", price)
  end
end