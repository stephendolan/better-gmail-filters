class UserQuery < User::BaseQuery
  def initialize
    defaults &.preload_teams(TeamQuery.new.preload_subscription).preload_filters
  end
end
