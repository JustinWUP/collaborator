class Newtags < ActiveRecord::Migration
  def change
  		add_column :topics, :topic_tag, :string, :default => "New Topic,newtopictag"
  end
end
