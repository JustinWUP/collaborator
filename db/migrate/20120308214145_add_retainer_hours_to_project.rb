class AddRetainerHoursToProject < ActiveRecord::Migration
  def change
    add_column :projects, :retainer_hours, :decimal

  end
end
