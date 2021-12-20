module ApiHelpers

  def json
    JSON.parse(response.body)
  end

  def login_with_api(customer)
    post '/api/login', params: {
        customer: {
            email: customer.email,
            password: customer.password
        }
    }
  end

end

