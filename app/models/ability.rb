class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:

    user ||= Employee.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
      can :create, Employee
    end
    if user.role? :manager

      # can see and edit own account info
      can :show, Employee do |e|
        e.id == user.id
      end
      can :edit, Employee do |e|
        e.id == user.id
      end

      can :edit, Post do |p|
        p.employee_id == user.id
      end

      can :delete, Post do |p|
        p.employee_id == user.id
      end

      can :create, Post
      can :read, :all
      can :manage, Member
      can :manage, Registration
      can :manage, WaitStatus
    end
  end
end
