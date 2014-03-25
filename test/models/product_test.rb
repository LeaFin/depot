require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "validation of price steps" do
    product = Product.new(title: "TestProuct",
                          description: "Bla",
                          image_url: "bla.jpg",
                          price: 1.34)
    assert product.invalid?
    assert_equal ["Price must be in 0.05 steps"], product.errors[:price]

    product.price = 1.25

    assert product.valid?
  end
end
