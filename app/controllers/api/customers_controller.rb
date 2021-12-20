class Api::CustomersController < Api::BaseController

  before_action :find_customer, only: %w[show]

  def show
    render_jsonapi_response(@customer)
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

end
