class CreateUsersProjects < ActiveRecord::Migration
  def up
  	create_table :users_projects, :id => false do |t|
  		t.references :user, :project
  	end
  end

  def down
  	drop_table :users_projects
  end
end
