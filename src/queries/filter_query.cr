class FilterQuery < Filter::BaseQuery
  def initialize
    defaults &.preload_variants
  end
end
