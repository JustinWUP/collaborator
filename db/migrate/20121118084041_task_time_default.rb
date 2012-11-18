class TaskTimeDefault < ActiveRecord::Migration
  def change
  	change_column :tasks, :time, :string, :default => "0.0"
  end
end
