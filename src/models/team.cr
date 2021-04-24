class Team < BaseModel
  table do
    column name : String
    column stripe_id : String?

    has_many users : User
    has_one subscription : Subscription?
  end
end
