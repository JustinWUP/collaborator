class AddEnabledToLabels < ActiveRecord::Migration
  def change
  	add_column :labels, :enabled, :boolean, :default => false
  end
end
