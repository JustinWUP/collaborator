class Ability
  include CanCan::Ability

  def initialize(user)    
      user ||= User.new 

      if user.role? :admin
        can :manage, :all
      else
        can :read, Project, :users => {:id => user.id }
        can :create, Topic
        can :read, Topic
        can :manage, Subscription, :user_id => user.id
        can :create, Comment 
        cannot :all, Setting
      end

  end
end
