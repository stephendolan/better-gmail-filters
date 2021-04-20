class Filter < BaseModel
  table do
    column name : String
    column search_query : String
    belongs_to category : Category?
  end
end
