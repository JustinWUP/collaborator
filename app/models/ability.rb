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
        can :manage, [Topic, Organization, Comment, Wiki]
        cannot :all, Setting
        can :read, Task, :users => {:id => user.id }
        can :update, Task
        can :review, Task
        cannot :approve, Task
        can :index, Task, :users => {:id => user.id }
        cannot :edit, Task
        cannot :charge, Task
        can :today, Task
        can :week, Task
      else
        can :read, Project, :users => {:id => user.id }
        can :read, Topic
        can :attach, Topic
        can :update, Topic
        can :create, [Topic, Comment]
        can :manage, Subscription, :user_id => user.id
        cannot :all, Setting
        cannot :all, Wiki
        cannot :all, Task
      end

  end
end
