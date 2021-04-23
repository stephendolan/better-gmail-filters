class SaveFilter < Filter::SaveOperation
  needs creator : User

  permit_columns name,
    search_query,
    category_id,
    should_mark_as_read,
    should_archive,
    should_star,
    should_never_mark_spam,
    should_mark_important,
    should_forward_to,
    should_apply_label

  before_save do
    set_creator
  end

  after_save create_filter_placeholders

  private def set_creator
    creator_id.value = creator.id
  end

  private def create_filter_placeholders(saved_filter : Filter)
    greedy_pattern = /{{\s*(.*?)\s*}}/
    placeholders = saved_filter
      .search_query
      .scan(greedy_pattern)
      .flat_map(&.captures)
      .reject(&.blank?)
      .compact
      .uniq!

    # Remove placeholders that are no longer necessary
    FilterPlaceholderQuery.new.filter_id(saved_filter.id).name.lower.not.in(placeholders).delete

    # Add new placeholders
    placeholders.each do |placeholder_name|
      next unless (FilterPlaceholderQuery.new.filter_id(saved_filter.id).name.lower.eq(placeholder_name).select_count == 0)

      SaveFilterPlaceholder.create!(
        filter: saved_filter,
        name: placeholder_name,
        values: [] of String
      )
    end
  end
end
