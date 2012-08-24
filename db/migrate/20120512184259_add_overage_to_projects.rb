class AddOverageToProjects < ActiveRecord::Migration
	def change
		add_column :projects, :overage, :integer
	end
end
