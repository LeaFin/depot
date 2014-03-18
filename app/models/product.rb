class Product < ActiveRecord::Base
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with:    %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.' }

    def price_in_steps
        if price and price % 0.05 != 0.0
            errors.add(:price, "Preis muss in 5 Rappen-Schritten angegeben werden.")
        end
    end 
    validate :price_in_steps
end
