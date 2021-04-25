class Filter < BaseModel
  table do
    belongs_to category : Category
    belongs_to creator : User
    has_many filter_placeholders : FilterPlaceholder

    column name : String
    column search_query : String

    column should_mark_as_read : Bool = false
    column should_archive : Bool = false
    column should_star : Bool = false
    column should_never_mark_spam : Bool = false
    column should_mark_important : Bool = false
    column should_forward_to : String?
    column should_apply_label : String?
  end

  def siblings(in_same_category : Bool = true) : FilterQuery
    query = if in_same_category
              FilterQuery.new.category_id(category_id).id.not.eq(id)
            else
              FilterQuery.new.creator_id(creator_id).id.not.eq(id)
            end

    query.preload_filter_placeholders
  end

  def search_permutations : Array(String)
    placeholders = filter_placeholders
    return [search_query] if placeholders.empty?

    placeholder_values = placeholders.map { |placeholder| placeholder.values.map { |value| {placeholder.name => value} } }
    placeholder_values.reject!(&.empty?)
    return [search_query] if placeholder_values.empty?

    placeholder_permutations = Array.product(placeholder_values)

    output_strings = [] of String

    placeholder_permutations.each do |replacement_set|
      return_string = search_query

      replacement_set.each do |placeholder_tuple|
        placeholder_tuple.each_key do |placeholder_name|
          replacement_regex = /\{\{\s*#{placeholder_name}\s*\}\}/
          return_string = return_string.gsub(replacement_regex, placeholder_tuple[placeholder_name])
        end
      end

      output_strings.push(return_string)
    end

    output_strings
  end
end
