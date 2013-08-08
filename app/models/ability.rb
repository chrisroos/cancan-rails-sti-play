class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Page, user_id: user.id
    can :read, Comment, page: {user_id: user.id}
  end
end
