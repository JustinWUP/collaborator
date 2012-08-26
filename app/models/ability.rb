class Ability
  include CanCan::Ability

  def initialize(user)    
      user ||= User.new 

      if user.role? :admin
        can :manage, :all
      elsif user.role? :wupteam
        can :manage, Project, :users => {:id => user.id}
        can :manage, Subscription, :user_id => user.id
        # can :manage, Subscription, :user_id => {Role.find_by_name("wupteam")}
        can :manage, [Topic, Organization, Comment]
        cannot :all, Setting
      else
        can :read, Project, :users => {:id => user.id }
        can :read, Topic
        can :create, [Topic, Comment]
        can :manage, Subscription, :user_id => user.id
        cannot :all, Setting
      end

  end
end
