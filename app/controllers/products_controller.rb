class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku)
  end
end
