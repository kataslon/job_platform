class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :company_owner
      can :manage, [Company, Vacancy]
      can [:edit, :update], [User]
      can [:edit, :update], [Response]
      can :read, :all
    elsif user.has_role? :manager
      can :manage, [Vacancy]
      can [:edit, :update], [Response]
      can [:new, :create, :show, :index], [Company]
      can [:edit, :update], [User], id: user.id
    elsif user.has_role? :applicant
      can :manage, [Proposal], id: user.proposals.pluck(:id)
      can [:edit, :update], [Response]
      can :read, [Vacancy]
      can [:new, :show, :index], [Company]
    else
      can [:new, :create, :show, :index], [Company]
      can :read, [Proposal]
      can :read, [Vacancy]
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
