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

  def perform_substitutions(string : String)
    output_string = string

    replacement_objects.each do |replacement|
      replacement_regex = /\{\{\s*#{replacement.placeholder}\s*\}\}/
      output_string = output_string.gsub(replacement_regex, replacement.value)
    end

    output_string
  end
end
