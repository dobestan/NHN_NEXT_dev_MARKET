class AddAttachmentMainImageToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :main_image
    end
  end

  def self.down
    drop_attached_file :items, :main_image
  end
end
