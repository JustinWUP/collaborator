class DropSomeHoursamountsFromTopics < ActiveRecord::Migration
  def change
  	remove_column :topics, :overage
  	remove_column :topics, :amountcomplete
  	remove_column :topics, :percentcomplete
  end
end
