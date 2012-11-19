class Task < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time, :topic_id, :user_ids, :billable, :changetag
  belongs_to :topic
  has_many :users, :through => :assignments
  has_many :assignments
  scope :active, :conditions => {:active => true}

  # change how time saves into the database before making it auditable
  audit :time
 

end
