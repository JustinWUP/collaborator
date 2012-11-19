class AddChangetagToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :changetag, :string, :default => "Task Created."
  end
end
