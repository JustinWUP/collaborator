class Doyouhaveproblem < ActiveRecord::Migration
def change
	remove_column :topics, :topic_status

end
end
