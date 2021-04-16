class SaveCategory < Category::SaveOperation
  needs current_user : User

  permit_columns label

  before_save do
    assign_owner
  end

  private def assign_owner
    owner_id.value = current_user.id
  end
end
