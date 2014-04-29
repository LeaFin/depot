class Cart < ActiveRecord::Base
    has_many :line_items, dependent: :destroy

    def get_total_price
        price = 0
        line_items.each do |line_item|
            price += line_item.product.price * line_item.quantity
        end
        return price
    end

    def add_product(product_id)
        current_item = line_items.find_by(product_id: product_id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product_id)
        end
          current_item
    end
end
