class AddDefaultToAutoTag < ActiveRecord::Migration
  def change
  	change_column :projects, :auto_tag, :string, :default => 'Client-Visible'
  end
end
