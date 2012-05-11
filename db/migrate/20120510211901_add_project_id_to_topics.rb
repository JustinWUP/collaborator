class AddProjectIdToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :project_id, :integer
  end
end
