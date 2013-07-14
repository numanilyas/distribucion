class AddAttachmentImageToQuotes < ActiveRecord::Migration
  def self.up
    change_table :quotes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :quotes, :image
  end
end
