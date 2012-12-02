class Task < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time, :topic_id, :user_ids, :billable, :changetag
  belongs_to :topic
  has_many :users, :through => :assignments
  has_many :assignments
  scope :active, :conditions => {:active => true}
  scope :today, :conditions => ['tasks.updated_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day]
  scope :this_week, :conditions => ["DATE(tasks.updated_at) >= DATE(?)", 7.days.ago]
  # change how time saves into the database before making it auditable
  audit :time
 

end
