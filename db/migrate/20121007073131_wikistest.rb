class Wikistest < ActiveRecord::Migration
  def change
  	change_column :wikis, :title, :string, :default => ""
  	change_column :wikis, :body, :text, :default => ""
  end
end
