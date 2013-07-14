class AddIndexToProductSamples < ActiveRecord::Migration
  def change
    add_column :product_samples, :index, :integer
  end
end
