class SaveFilterPlaceholder < FilterPlaceholder::SaveOperation
  needs filter : Filter

  permit_columns name, values

  before_save do
    validate_uniqueness_of name, query: FilterPlaceholderQuery.new.filter_id(filter.id).name
    assign_filter
  end

  private def assign_filter
    filter_id.value = filter.id
  end
end
