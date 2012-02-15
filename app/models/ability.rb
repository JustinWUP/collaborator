class Ability
  include CanCan::Ability

  def initialize(user)    
      user ||= User.new 

      if user.role? :admin
        can :manage, :all
      else
        can :read, Project, :users => {:id => user.id }
        cannot :all, Setting
      end

  end
end
