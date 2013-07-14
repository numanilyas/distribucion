class AddAttachmentImageToProductSamples < ActiveRecord::Migration
  def self.up
    change_table :product_samples do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :product_samples, :image
  end
end
