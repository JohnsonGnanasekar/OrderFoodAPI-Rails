require 'faker'
require 'factory_bot_rails'

module CustomerHelpers

  def create_customer
    FactoryBot.create(:customer,
                      email: Faker::Internet.email,
                      password: Faker::Internet.password
    )
  end

  def build_customer
    FactoryBot.build(:customer,
                     email: Faker::Internet.email,
                     password: Faker::Internet.password
    )
  end

end
