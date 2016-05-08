require 'cancancan'
class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when 'User'
      can :index, :user_api
    when 'Admin'
      can :manage, :all
    end   
  end
end