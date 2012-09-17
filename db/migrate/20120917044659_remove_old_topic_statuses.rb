class RemoveOldTopicStatuses < ActiveRecord::Migration
  def change
remove_column :topics, :topiccomplete
remove_column :topics, :awaitingapproval
  end
end
