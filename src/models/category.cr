class Category < BaseModel
  table do
    column label : String

    belongs_to owner : User
    has_many filters : Filter
  end
end
