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

  private def set_creator
    creator_id.value = creator.id
  end
end
