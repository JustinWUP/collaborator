class Idonotknowwhattofucktodowithsubscriptiondefault < ActiveRecord::Migration
 def change
    change_column :subscriptions, :enabled, :boolean, :default => false
  end
end
