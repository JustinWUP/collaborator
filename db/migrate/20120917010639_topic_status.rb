class TopicStatus < ActiveRecord::Migration
	def change
		add_column :topics, :topic_status, :string, :default => "working"
	end
end
