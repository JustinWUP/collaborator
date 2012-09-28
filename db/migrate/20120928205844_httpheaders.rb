class Httpheaders < ActiveRecord::Migration
def change
		add_column :topics, :report_lastpage, :string, :default => "None"
	end
end
