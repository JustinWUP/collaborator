class Requiredtime < ActiveRecord::Migration
	def change
		add_column :topics, :hoursreq, :integer
		add_column :topics, :hoursused, :integer
	end
end

