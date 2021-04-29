class FilterQuery < Filter::BaseQuery
  def initialize
    defaults &.preload_variants(FilterVariantQuery.new.created_at.asc_order)
  end
end
