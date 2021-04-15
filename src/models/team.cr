class Team < BaseModel
  table do
    column name : String

    has_many users : User
  end
end
