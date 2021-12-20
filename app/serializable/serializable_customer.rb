class SerializableCustomer < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers
  type 'customers'

  attributes :email

  link :self do
    @url_helpers.api_customer_url(@object.id)

  end
end