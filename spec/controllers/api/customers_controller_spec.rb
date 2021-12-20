require 'rails_helper'

describe Api::CustomersController, type: :request do

  let (:customer) { create_customer }

  context 'When fetching a customer' do
    before do
      login_with_api(customer)
      get "/api/customers/#{customer.id}", headers: {
          'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the customer' do
      expect(json['data']).to have_id(customer.id.to_s)
      expect(json['data']).to have_type('customers')
    end
  end

  context 'When a customer is missing' do
    before do
      login_with_api(customer)
      get "/api/customers/blank", headers: {
          'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(404)
    end
  end

  context 'When the Authorization header is missing' do
    before do
      get "/api/customers/#{customer.id}"
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

end