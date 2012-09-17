class TopicStatusWhynowork < ActiveRecord::Migration
  def up
  	add_column :topics, :work_status, :integer, :default => "1"
  end

  def down
		
  end
end
