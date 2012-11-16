class Task < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time, :topic_id, :user_ids
  belongs_to :topic
  has_many :users, :through => :assignments
  has_many :assignments
end
