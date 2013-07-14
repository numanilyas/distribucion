class AddUniqueIndexToProductsTitle < ActiveRecord::Migration
  def change
    add_index :products, :title, unique: true
  end
end
