class ChangeLabel < ActiveRecord::Migration
  def change
  	rename_column :labels, :project_id, :assignment_id
  end

  
end
