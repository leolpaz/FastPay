class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create], Group, user_id: user.id
    can %i[read create], Payment, author_id: user.id
  end
end
