class AddOverageToTopics < ActiveRecord::Migration
	def change
		add_column :topics, :overage, :integer
	end
end
