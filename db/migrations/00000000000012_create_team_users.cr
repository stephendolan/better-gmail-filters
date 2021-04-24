class CreateTeamUsers::V00000000000012 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(TeamUser) do
      primary_key id : UUID
      add_belongs_to team : Team, on_delete: :cascade, foreign_key_type: UUID
      add_belongs_to user : User, on_delete: :cascade, foreign_key_type: UUID
      add is_admin : Bool, default: false
      add_timestamps
    end

    create_index :team_users, [:team_id, :user_id], unique: true
  end

  def rollback
    drop table_for(TeamUser)
  end
end
