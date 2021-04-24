class CreateTeams::V00000000000005 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Team) do
      primary_key id : UUID
      add_timestamps
      add name : String
      add stripe_id : String?, index: true, unique: true
    end
  end

  def rollback
    drop table_for(Team)
  end
end
