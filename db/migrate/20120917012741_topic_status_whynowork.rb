class TopicStatusWhynowork < ActiveRecord::Migration
  def up
  	add_column :topics, :work_status, :integer, :default => "1"
  end

  def down
		drop_column :topics, :topic_status
  end
end
