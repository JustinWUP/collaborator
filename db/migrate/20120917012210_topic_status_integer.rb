class TopicStatusInteger < ActiveRecord::Migration
change_column :topics, :topic_status, :integer, :default => 1
end
