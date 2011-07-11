class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("無効な商品ID#{params[:id]}にアクセスしようとしました")
    redirect_to_index("無効な商品です")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("カートは現在空です")
  end
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

private
  def find_cart
    session[:cart] ||= Cart.new
  end
end
