class Ability
  include CanCan::Ability
=begin
  def initialize(user)
    can :read, [Post, Comment]
    return unless user.present?
    can :manage, [Post, Comment], author: user

    return unless user.admin?
  end
=end
end
