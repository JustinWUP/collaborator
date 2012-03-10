class ChangeProjectsAddAutoTag < ActiveRecord::Migration
	def change
		add_column :projects, :auto_tag, :string
	end
end
