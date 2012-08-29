class Subscriptiontruetest < ActiveRecord::Migration
  def change
    change_column :subscriptions, :enabled, :boolean, :default => true
  end
end
