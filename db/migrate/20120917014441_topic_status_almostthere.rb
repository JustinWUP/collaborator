class TopicStatusAlmostthere < ActiveRecord::Migration
  def change
  	change_column :topics, :work_status, :integer, :default => 1
	remove_column :topics, :topic_status
  end
end
