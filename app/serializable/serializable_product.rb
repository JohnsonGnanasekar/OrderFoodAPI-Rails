class SerializableProduct < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers
  type 'products'

  attributes :name , :price

  link :self do
    @url_helpers.api_product_url(@object.id)

  end
end
