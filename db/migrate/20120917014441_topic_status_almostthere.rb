class TopicStatusAlmostthere < ActiveRecord::Migration
  def change
  	change_column :topics, :work_status, :integer, :default => 1
  end
end
