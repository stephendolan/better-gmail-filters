class UserQuery < User::BaseQuery
  def initialize
    defaults &.preload_team
  end
end
