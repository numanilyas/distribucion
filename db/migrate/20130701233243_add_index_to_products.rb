class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_column :products, :index, :integer
  end
end
