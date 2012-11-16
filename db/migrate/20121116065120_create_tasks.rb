class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.decimal :time
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
