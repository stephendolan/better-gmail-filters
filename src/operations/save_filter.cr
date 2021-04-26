class SaveFilter < Filter::SaveOperation
  include Lucky::TextHelpers

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

  attribute readonly_account_labels : String

  before_save do
    set_creator
    validate_not_over_placeholder_limit
  end

  after_save create_filter_placeholders

  private def set_creator
    creator_id.value = creator.id
  end

  private def validate_not_over_placeholder_limit
    placeholder_limit = 5
    placeholder_count = [
      StringWithPlaceholders.new(search_query.value),
      StringWithPlaceholders.new(should_apply_label.value),
      StringWithPlaceholders.new(should_forward_to.value),
    ].sum(&.placeholders.size)
    placeholders_to_remove = placeholder_count - placeholder_limit

    if placeholder_count > placeholder_limit
      search_query.add_error "has a few too many placeholders (#{placeholder_count} / #{placeholder_limit}). You need to remove #{pluralize(placeholders_to_remove, "placeholder")}"
    end
  end

  private def create_filter_placeholders(saved_filter : Filter)
    placeholders = saved_filter.placeholders

    # Remove placeholders that are no longer necessary
    FilterPlaceholderQuery.new.filter_id(saved_filter.id).name.lower.not.in(placeholders).delete

    # Add new placeholders
    placeholders.each do |placeholder_name|
      next unless (FilterPlaceholderQuery.new.filter_id(saved_filter.id).name.lower.eq(placeholder_name).select_count == 0)

      SaveFilterPlaceholder.create!(
        filter: saved_filter,
        current_user: creator,
        name: placeholder_name,
        values: [] of String
      )
    end
  end
end
