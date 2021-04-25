class FilterPlaceholder < BaseModel
  table do
    column name : String
    column values : Array(String)
    belongs_to filter : Filter
  end

  def siblings
    FilterPlaceholderQuery.new.filter_id(filter_id).id.not.eq(id)
  end
end
