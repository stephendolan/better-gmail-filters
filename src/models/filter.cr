class Filter < BaseModel
  table do
    belongs_to category : Category?
    belongs_to creator : User

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
end
