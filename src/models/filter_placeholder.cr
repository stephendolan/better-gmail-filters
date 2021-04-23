class FilterPlaceholder < BaseModel
  table do
    column name : String
    column values : Array(String)
    belongs_to filter : Filter
  end
end
