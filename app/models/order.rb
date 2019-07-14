class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def update_totals
    calculated_subtotal = 0
    calculated_tax = 0
    calculated_total = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
      calculated_tax += carted_product.quantity * carted_product.product.tax
      calculated_total += carted_product.quantity * carted_product.product.total
    end
    self.subtotal = calculated_subtotal
    self.tax = calculated_tax
    self.total = calculated_total
    self.save
  end
end
