class AddUniqueIndexToProductSamplesTitle < ActiveRecord::Migration
  def change
    add_index :product_samples, :title, unique: true
  end
end
