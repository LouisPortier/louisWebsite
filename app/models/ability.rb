class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      cannot :manage, User
      can :manage, User, id: user.id
      cannot :index, User
      can [:read, :create], Comment
      cannot [:destroy], Comment
      can [:read], Product
      cannot [:edit, :create, :update, :destroy], Product
    end
  end
end
