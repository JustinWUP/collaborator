class AddWasbilledToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :wasbilled, :boolean, :default => false
  end
end
