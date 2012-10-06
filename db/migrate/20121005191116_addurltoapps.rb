class Addurltoapps < ActiveRecord::Migration
  def change
  	add_column :apps, :appurl, :string, :default => ""
  end
end
