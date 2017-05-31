class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:

    user ||= Employee.new # guest user (not logged in)
    if user.role? :admin
        can :manage, :all
    else
        can :read, :all
    end
  end
end
