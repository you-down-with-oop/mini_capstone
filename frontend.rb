require "http"
require "tty-table"

system "clear"
puts "Welcome to the products app!"

while true
  puts "Choose an option:"
  puts "[1] Show all products"
  puts "[2] Create a product"
  puts "[3] Show one product"
  puts "[4] Update one product"
  puts "[5] Destroy one product"
  puts "[q] Quit"
  input_choice = gets.chomp
  if input_choice == "1"
    response = HTTP.get("http://localhost:3000/api/products")
    products = response.parse

    # Display products with pretty print
    # pp products

    # Or display products with tty-table
    header_row = ["id", "name", "price", "description"]
    data_rows = products.map { |product| [product["id"], product["name"], product["price"], product["description"][0..20]] }
    table = TTY::Table.new header_row, data_rows
    puts table.render(:ascii)
  elsif input_choice == "2"
    params = {}
    print "Name: "
    params["name"] = gets.chomp
    print "Price: "
    params["price"] = gets.chomp
    print "Image url: "
    params["image_url"] = gets.chomp
    print "Description: "
    params["description"] = gets.chomp
    response = HTTP.post("http://localhost:3000/api/products", form: params)
    product = response.parse
    pp product
  elsif input_choice == "3"
    print "Enter the product id to display: "
    input_id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/products/#{input_id}")
    product = response.parse
    pp product
  elsif input_choice == "4"
    print "Enter the product id to update: "
    input_id = gets.chomp
    params = {}
    print "Name: "
    params["name"] = gets.chomp
    print "Price: "
    params["price"] = gets.chomp
    print "Image url: "
    params["image_url"] = gets.chomp
    print "Description: "
    params["description"] = gets.chomp
    params = params.delete_if { |_key, value| value.empty? }
    response = HTTP.patch("http://localhost:3000/api/products/#{input_id}", form: params)
    product = response.parse
    pp product
  elsif input_choice == "5"
    print "Enter the product id to destroy: "
    input_id = gets.chomp
    response = HTTP.delete("http://localhost:3000/api/products/#{input_id}")
    message = response.parse
    pp message
  elsif input_choice == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid option."
  end
  puts
end
