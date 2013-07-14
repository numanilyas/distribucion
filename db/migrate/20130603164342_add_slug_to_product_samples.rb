class AddSlugToProductSamples < ActiveRecord::Migration
  def change
    add_column :product_samples, :slug, :string
    add_index :product_samples, :slug, unique: true
  end
end
