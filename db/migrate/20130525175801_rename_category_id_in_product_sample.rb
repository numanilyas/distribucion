class RenameCategoryIdInProductSample < ActiveRecord::Migration
  def up
    rename_column :product_samples, :category_id, :product_id
  end

  def down
    rename_column :product_samples, :product_id, :category_id
  end
end
