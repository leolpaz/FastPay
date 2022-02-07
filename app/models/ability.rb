# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can [:read, :create], Group, user_id: user.id
    can [:read, :create], Payment, user_id: user.id
  end
end
