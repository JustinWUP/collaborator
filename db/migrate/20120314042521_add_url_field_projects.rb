class AddUrlFieldProjects < ActiveRecord::Migration
	def change
		add_column :projects, :url, :string
	end
end
