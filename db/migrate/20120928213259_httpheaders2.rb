class Httpheaders2 < ActiveRecord::Migration
def change
		add_column :topics, :report_environment, :string, :default => "None"
	end
end
