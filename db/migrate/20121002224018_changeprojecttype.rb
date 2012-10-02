class Changeprojecttype < ActiveRecord::Migration
def change
		remove_column :projects, :type
		add_column :projects, :ptype, :string, :default => "Site"
	end
end
