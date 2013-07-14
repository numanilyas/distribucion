class CreateProductSamples < ActiveRecord::Migration
  def change
    create_table :product_samples do |t|
      t.integer :category_id
      t.string :title
      t.string :size
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
