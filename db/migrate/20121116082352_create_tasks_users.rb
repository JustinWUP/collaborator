class CreateTasksUsers < ActiveRecord::Migration
  def up
  	create_table :tasks_users do |t|
  		t.references :user, :task
  	end
  end

  def down
  	drop_table :tasks_users
  end
end
