class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :manage, Snippet do |s|
      s.user == user
    end

    if user.is_admin?
      can :manage, :all
    else
      can :read, :all
    end
    
  end
end
