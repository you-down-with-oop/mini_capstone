class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jb"
  end

  def first_product_method
    @product = Product.first
    render "one_product.json.jb"
  end

  def second_product_method
    @product = Product.second
    render "one_product.json.jb"
  end

  def third_product_method
    @product = Product.third
    render "one_product.json.jb"
  end
end
