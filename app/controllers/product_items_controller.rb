class ProductItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_product_item, only: [:show, :destroy]

  def create
    product = Product.find(params[:product_id])
    @product_item = @cart.add_product(product.id)
    if @product_item.save
      redirect_to shop_url, notice: 'Product added to cart'
    else
      render :new
    end
  end

  private

  def set_product_item
    @product_item = ProductItem.find(params[:id])
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  end

  def product_item_params
    params.require(:product_item).permit(:product_id)
  end

end
