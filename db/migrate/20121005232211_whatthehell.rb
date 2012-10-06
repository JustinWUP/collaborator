class Whatthehell < ActiveRecord::Migration
  def change
  	add_column :wikis, :postcategory, :string
  end
end
