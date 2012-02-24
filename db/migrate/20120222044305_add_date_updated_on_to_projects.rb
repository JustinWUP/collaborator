class AddDateUpdatedOnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :date_updated_on, :datetime

  end
end
