class Api::ProductsController < ApplicationController
  def index
    render jsonapi: Product.all
  end

  def show
    render_jsonapi_response(Product.find(params[:id]))
  end

  def create
    product = Product.new(product_params)

    if product.save
      render jsonapi:product, status: :created
    else
      render jsonapi: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:product][:name]
    product.price = params[:product][:price]
    if product.save
      render jsonapi:product
    else
      render jsonapi: product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render jsonapi: Product.destroy(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
