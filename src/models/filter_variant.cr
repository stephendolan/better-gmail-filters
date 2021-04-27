class FilterVariant < BaseModel
  table do
    column replacements : JSON::Any
    belongs_to filter : Filter
  end

  def replacement_objects : Array(FilterVariants::Replacement)
    FilterVariants::ReplacementSet
      .from_json(replacements.to_json)
      .replacements
  end
end
