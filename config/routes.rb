Rails.application.routes.draw do
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    get "/first_product_url" => "products#first_product_method"
    get "/second_product_url" => "products#second_product_method"
    get "/third_product_url" => "products#third_product_method"
  end
end
