class CreateUsers::V00000000000010 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : UUID
      add_timestamps
      add email : String, unique: true
      add google_id : String, unique: true
      add google_access_token : String, unique: true
      add google_access_token_expires_at : Time, unique: true
      add google_refresh_token : String, unique: true
      add first_name : String?
      add last_name : String?
      add image_url : String?
      add_belongs_to team : Team, on_delete: :restrict, foreign_key_type: UUID
    end
  end

  def rollback
    drop table_for(User)
  end
end
