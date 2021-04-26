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
    set_placeholders
    validate_placeholder_limit_unreached
  end

  private def set_creator
    creator_id.value = creator.id
  end

  private def set_placeholders
    placeholders.value = derived_placeholders_from_form
  end

  private def validate_placeholder_limit_unreached
    return if creator.active_subscription?

    placeholder_limit = Subscription::FREE_TIER_PLACEHOLDER_LIMIT
    placeholder_count = derived_placeholders_from_form.size
    placeholders_to_remove = placeholder_count - placeholder_limit

    if placeholder_count > placeholder_limit
      search_query.add_error "has a few too many placeholders (#{placeholder_count} / #{placeholder_limit}). You need to remove #{pluralize(placeholders_to_remove, "placeholder")}"
    end
  end

  private def derived_placeholders_from_form
    [
      StringWithPlaceholders.new(search_query.value),
      StringWithPlaceholders.new(should_apply_label.value),
      StringWithPlaceholders.new(should_forward_to.value),
    ].flat_map(&.placeholders).uniq!
  end
end
