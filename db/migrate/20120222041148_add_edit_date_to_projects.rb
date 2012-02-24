class AddEditDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :edit_date, :datetime
  end
end
