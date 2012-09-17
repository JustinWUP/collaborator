class TopicsAwaitingApproval < ActiveRecord::Migration
def change
		add_column :topics, :awaitingapproval, :boolean, :default => false
	end
end
