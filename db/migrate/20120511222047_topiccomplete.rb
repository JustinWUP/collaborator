class Topiccomplete < ActiveRecord::Migration
	def change
		add_column :topics, :topiccomplete, :boolean
	end
end
