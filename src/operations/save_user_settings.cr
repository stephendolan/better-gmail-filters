class SaveUserSettings < User::SaveOperation
  permit_columns first_name, last_name

  attribute readonly_email : String
  attribute readonly_team : String
end
