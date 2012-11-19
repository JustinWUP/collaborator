class ChangeTasksChangetagToText < ActiveRecord::Migration
  def change
  	change_column :tasks, :changetag, :text, :default =>"Task Created."
  end
end
