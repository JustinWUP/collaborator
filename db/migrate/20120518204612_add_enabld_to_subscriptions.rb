class AddEnabldToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :enabled, :boolean, :default => true
  end
end
