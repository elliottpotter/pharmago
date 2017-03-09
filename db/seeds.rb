# Let's seed!

30.times do

  # Create customers
  1.times do
    user                     = User.new
    user.email               = Faker::Internet.email
    user.password            = Faker::Internet.password.to_s
    user.first_name          = Faker::Name.first_name
    user.last_name           = Faker::Name.last_name
    user.country_code        = "+45"

    user.save!
    user.admin               = false
    1.times do
      customer               = Customer.new
      customer.user          = user
      customer.phone_number  = Faker::PhoneNumber.phone_number
      customer.save!
    end
  end

  # Create Drivers
  1.times do
    user                    = User.new
    user.email              = Faker::Internet.email
    user.password           = Faker::Internet.password.to_s
    user.first_name         = Faker::Name.first_name
    user.last_name          = Faker::Name.last_name
    user.country_code       = "+45"
    user.save!
    user.admin              = false
    1.times do
      driver                = Driver.new
      driver.user           = user
      driver.address        = Faker::Address.street_address
      driver.phone_number   = Faker::PhoneNumber.phone_number
      driver.verification_code = rand(10000..99999).to_s
      driver.save!
    end
  end

  # Create products
  1.times do
    product                    = Product.new
    product.name               = Faker::Commerce.product_name
    product.price              = [5, 6, 10, 15, 20].sample
    product.url                = Faker::Internet.url
    product.save!
  end

  # Create orders
  1.times do
    order                    = Order.new
    order.delivered_at       = Time.now
    order.customer           = Customer.last
    order.driver             = Driver.last
    order.delivery_date      = Date.today
    order.amount             = [15, 20, 30, 50, 100].sample
    order.aasm_state         = :unpaid
    order.save!
  end

  # Create order products
  1.times do
    order_product               = OrderProduct.new
    order_product.quantity      = [1, 2, 3, 4, 5].sample
    order_product.product       = Product.last
    order_product.order         = Order.last
    order_product.save!
  end

  # Create customer adresses
  1.times do
    customer_address               = CustomerAddress.new
    customer_address.address       = Faker::Address.street_address
    customer_address.customer      = Customer.last
    customer_address.save!
  end
end
