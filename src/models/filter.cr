class Filter < BaseModel
  table do
    belongs_to category : Category
    belongs_to creator : User

    column name : String
    column search_query : String
    column placeholders : Array(String)

    column should_mark_as_read : Bool = false
    column should_archive : Bool = false
    column should_star : Bool = false
    column should_never_mark_spam : Bool = false
    column should_mark_important : Bool = false
    column should_forward_to : String?
    column should_apply_label : String?
  end

  def siblings(in_same_category : Bool = true) : FilterQuery
    if in_same_category
      FilterQuery.new.category_id(category_id).id.not.eq(id)
    else
      FilterQuery.new.creator_id(creator_id).id.not.eq(id)
    end
  end

  def derived_placeholders : Array(String)
    StringWithPlaceholders.new(search_query).placeholders |
      StringWithPlaceholders.new(should_apply_label).placeholders |
      StringWithPlaceholders.new(should_forward_to).placeholders
  end

  def search_permutations : Array(String)
    [search_query]
  end
end
