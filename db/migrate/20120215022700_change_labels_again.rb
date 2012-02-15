class ChangeLabelsAgain < ActiveRecord::Migration
	def change
		rename_column :labels, :assignment_id, :project_id
	end
end
