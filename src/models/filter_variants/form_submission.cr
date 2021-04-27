struct FilterVariants::FormSubmission
  FORM_FIELD_PREFIX = "placeholder:"

  getter placeholder_params : FilterVariants::ReplacementSet

  # Say we have a `Filter` with this `Filter#search_query`:
  # * "from:{{ one_field }} to:{{ another_field }} list:{{last_field}}"
  #
  # We generate a form with these dynamic placeholders, which is passed here like this:
  # * placeholder:one_field="My first value"
  # * placeholder:another_field="My second value"
  # * placeholder:last_field="My third value"
  #
  # This method generates a FilterVariants::ReplacementSet object that looks like this:
  # ```
  # {
  #   replacements: [
  #     {placeholder: "one_field", value: "My first value"},
  #     {placeholder: "another_field", value: "My second value"},
  #     {placeholder: "last_field", value: "My third value"},
  #   ],
  # }
  # ```
  def initialize(params : Lucky::Params)
    replacements = params.from_form_data
      .select { |name, _value| name.starts_with?(FORM_FIELD_PREFIX) }
      .reject { |_name, value| value.blank? }
      .map { |name, value| FilterVariants::Replacement.new(placeholder: name.lchop(FORM_FIELD_PREFIX), value: value) }

    @placeholder_params = FilterVariants::ReplacementSet.new(replacements)
  end
end
