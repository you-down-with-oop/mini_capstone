class Image < ApplicationRecord
  def product
    Product.find_by(id: self.product_id)
  end
end
