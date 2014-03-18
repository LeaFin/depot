require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "validation of price steps" do
    product = Product.new(title: "TestProuct",
                          description: "Bla",
                          image_url: "bla.jpg",
                          price: 1.34)
    assert product.invalid?
    assert_equal ["Preis muss in 5 Rappen-Schritten angegeben werden."], product.errors[:price]

    product.price = 1.25

    assert product.valid?
  end
end
