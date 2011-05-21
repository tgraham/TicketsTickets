class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :show, :to => :view
    alias_action :index, :to => :list
    
    user ||= User.new # guest user account
     
    if user.role? :admin
      can :manage, :all
    elsif user.role? :tech
      can :manage, :all
    elsif user.role? :supervisor
      can :manage, :all
    elsif user.role? :user
      can :manage, :all
    else
      # for non logged in users
      
    end
  end
end
