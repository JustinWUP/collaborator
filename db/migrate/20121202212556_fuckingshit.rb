class Fuckingshit < ActiveRecord::Migration
  def change
  	change_column :tasks, :active, :boolean
  end
end
