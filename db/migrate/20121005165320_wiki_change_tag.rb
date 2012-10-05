class WikiChangeTag < ActiveRecord::Migration
  def change
  	add_column :wikis, :changetag, :string, :default => ""
  end
end
