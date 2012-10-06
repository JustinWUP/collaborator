class Username < ActiveRecord::Migration
  def change
  	add_column :users, :firstname, :string, :default => ""
  end
end
