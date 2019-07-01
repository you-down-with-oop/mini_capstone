class ChangeProductsPriceToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, :precision => 9, :scale => 2
  end
end
