class Topicmailenabled < ActiveRecord::Migration
 def change
    add_column :users, :topicmail, :boolean, :default => true
 end
end
