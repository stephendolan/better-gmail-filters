class CreateUsers::V00000000000010 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : UUID
      add_timestamps
      add email : String, unique: true
      add google_id : String, unique: true
      add first_name : String?
      add last_name : String?
      add image_url : String?
    end
  end

  def rollback
    drop table_for(User)
  end
end
