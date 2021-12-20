require 'rails_helper'

describe RegistrationsController, type: :request do

  let (:customer) { build_customer }
  let (:existing_customer) { create_customer }
  let (:signup_url) { '/api/signup' }

  context 'When creating a new customer' do
    before do
      post signup_url, params: {
          customer: {
              email: customer.email,
              password: customer.password
          }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the customer email' do
      expect(json['data']).to have_attribute(:email).with_value(customer.email)
    end
  end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
          customer: {
              email: existing_customer.email,
              password: existing_customer.password
          }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

end
