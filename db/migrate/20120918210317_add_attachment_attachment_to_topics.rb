class AddAttachmentAttachmentToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :topics, :attachment
  end
end
