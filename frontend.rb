require "http"
require "tty-table"

system "clear"
puts "Welcome to the products app!"

while true
  puts "Choose an option:"
  puts "[1] Show one product"
  puts "[2] Show all products"
  puts "[q] Quit"
  input_choice = gets.chomp
  if input_choice == "1"
    response = HTTP.get("http://localhost:3000/api/first_product_url")
    product = response.parse
    pp product
  elsif input_choice == "2"
    response = HTTP.get("http://localhost:3000/api/all_products_url")
    products = response.parse

    # Display products with pretty print
    # pp products

    # Or display products with tty-table
    header_row = ["id", "name", "price", "description"]
    data_rows = products.map { |product| [product["id"], product["name"], product["price"], product["description"][0..20]] }
    table = TTY::Table.new header_row, data_rows
    puts table.render(:ascii)
  elsif input_choice == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid option."
  end
  puts
end
