class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
