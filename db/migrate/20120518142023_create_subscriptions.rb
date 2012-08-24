class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :subscribable, :polymorphic => true
      t.timestamps
    end
  end
end
