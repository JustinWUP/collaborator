class Task < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time, :topic_id, :user_ids, :billable
  belongs_to :topic
  has_many :users, :through => :assignments
  has_many :assignments
  scope :active, :conditions => {:active => true}
  validate :time_like_a_butterfly
  # change how time saves into the database before making it auditable
  # audit :time
 
  def time_like_a_butterfly
    errors.add(:time, "needs to have a decimal - at least a '.0'") unless ((self.time.include? ".") or (self.time.include? ":"))
  end
end
