class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
