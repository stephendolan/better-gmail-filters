class Category < BaseModel
  table do
    column label : String

    belongs_to owner : User
  end
end
