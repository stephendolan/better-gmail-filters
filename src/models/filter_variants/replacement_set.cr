class FilterVariants::ReplacementSet
  include JSON::Serializable

  property replacements : Array(FilterVariants::Replacement)

  def initialize(@replacements : Array(FilterVariants::Replacement))
  end
end
