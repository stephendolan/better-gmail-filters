class Filter < BaseModel
  table do
    belongs_to category : Category
    belongs_to creator : User
    has_many variants : FilterVariant

    column name : String
    column is_public : Bool = false
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

  def actions_string : String
    actions = [] of String

    actions.push "apply label" if should_apply_label
    actions.push "mark as read" if should_mark_as_read?
    actions.push "skip inbox" if should_archive?
    actions.push "star" if should_star?
    actions.push "never mark spam" if should_never_mark_spam?
    actions.push "mark as important" if should_mark_important?
    actions.push "forward" if should_forward_to

    actions.map(&.capitalize)

    actions.join(", ")
  end

  # We always want to access placeholders sorted alphabetically
  def placeholders : Array(String)
    previous_def.sort
  end

  def variant_count : Number
    if variants!.empty?
      1
    else
      variants!.size
    end
  end

  def siblings(in_same_category : Bool = true) : FilterQuery
    if in_same_category
      FilterQuery.new.category_id(category_id).id.not.eq(id)
    else
      FilterQuery.new.creator_id(creator_id).id.not.eq(id)
    end
  end

  def search_permutations : Array(String)
    [search_query]
  end
end
