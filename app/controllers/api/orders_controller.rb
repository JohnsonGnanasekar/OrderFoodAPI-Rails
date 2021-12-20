class Api::OrdersController < Api::BaseController
#class Api::OrdersController < ApplicationController

  before_action :find_customer, only: :create

  def create
    product = Product.find(order_params[:product_id])
    qty = order_params[:qty]
    cost = qty * product.price
    order = Order.new(customer_id: @customer.id, cost: cost)
    if(order.save)
      order_product = OrderProduct.new(order_id: order.id, product_id: product.id, qty: qty)
      if (order_product.save)
        render json:order, status: :created
      else
        render json:order_product.errors, status: :unprocessable_entity
      end
    else
      render json:order.errors, status: :unprocessable_entity
    end

  end

  def show
    render json: Order.find(params[:id])
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def order_params
    params.require(:order).permit(:product_id, :qty)
  end

  end
