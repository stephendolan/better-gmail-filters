class SaveFilterPlaceholder < FilterPlaceholder::SaveOperation
  needs filter : Filter

  attribute value_string : String

  before_save do
    # validate_uniqueness_of name, query: FilterPlaceholderQuery.new.filter_id(filter.id).name.lower
    assign_filter
    convert_value_string_to_array
  end

  # Because form inputs will be comma-delimited strings, massage in to an Array(String)
  private def convert_value_string_to_array
    if (submitted_values = value_string.value)
      values.value = submitted_values.split(",").map(&.strip).reject(&.blank?).compact.uniq!
    else
      values.value = [] of String
    end
  end

  private def assign_filter
    filter_id.value = filter.id
  end
end
