class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :width
      t.string :height
      t.string :quantity
      t.text :comments
      t.string :requiredate
      t.string :name
      t.string :email
      t.string :phone
      t.string :fax
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
