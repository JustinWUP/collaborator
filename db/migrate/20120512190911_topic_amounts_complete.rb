class TopicAmountsComplete < ActiveRecord::Migration
	def change
		add_column :topics, :amountcomplete, :integer
		add_column :topics, :percentcomplete, :integer
	end
end
