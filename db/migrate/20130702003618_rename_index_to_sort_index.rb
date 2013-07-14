class RenameIndexToSortIndex < ActiveRecord::Migration
  def up
    rename_column :products, :index, :sort_index
    rename_column :product_samples, :index, :sort_index
  end

  def down
  end
end
