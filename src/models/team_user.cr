class TeamUser < BaseModel
  table do
    belongs_to team : Team
    belongs_to user : User
    column is_admin : Bool = false
  end
end
