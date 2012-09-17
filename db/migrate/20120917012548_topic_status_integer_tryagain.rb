class TopicStatusIntegerTryagain < ActiveRecord::Migration
  def change
change_column :topics, :topic_status, :integer, :default => 1
  end
end
