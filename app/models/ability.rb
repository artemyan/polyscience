class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, Group, :id => Group.with_role(:moderator, user).pluck(:id)
      can :manage, Scientist, :id => Scientist.with_role(:moderator, user).pluck(:id)
    end
  end
end