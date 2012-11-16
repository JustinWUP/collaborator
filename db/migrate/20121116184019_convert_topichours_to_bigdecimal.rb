class ConvertTopichoursToBigdecimal < ActiveRecord::Migration
  def change
		change_column :topics, :hoursreq, :decimal
		change_column :topics, :hoursused, :decimal
  end
end
