class ChangeTopicsAmountcompleteToFloat < ActiveRecord::Migration
	def change
		change_column :topics, :amountcomplete, :float
  end
end
