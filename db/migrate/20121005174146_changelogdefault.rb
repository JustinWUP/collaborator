class Changelogdefault < ActiveRecord::Migration
  def change
  	change_column :wikis, :changetag, :string, :default => "Article Created."
  end
end
