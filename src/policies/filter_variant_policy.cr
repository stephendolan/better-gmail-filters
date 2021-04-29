class FilterVariantPolicy < ApplicationPolicy(Filter)
  delegate create?, update?, delete?, to: FilterPolicy.new(user: user, record: record)
end
