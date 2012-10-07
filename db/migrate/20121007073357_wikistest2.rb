class Wikistest2 < ActiveRecord::Migration
  def change
  	change_column :wikis, :postcategory, :string, :default => ""

  end
end
