class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:

    user ||= Employee.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    end
    if user.role? :manager

      # can see and edit own account info
      can :show, Employee do |e|
        e.id == user.id
      end
      can :edit, Employee do |e|
        e.id == user.id
      end
      
      can :read, :all
      can :manage, :member
      can :manage, :registration
      can :manage, :wait_status
    end
  end
end
