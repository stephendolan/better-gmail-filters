class CreateSubscriptions::V00000000000017 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Subscription) do
      primary_key id : UUID

      add stripe_id : String, index: true, unique: true
      add is_active : Bool
      add stripe_data : JSON::Any

      add_belongs_to team : Team, on_delete: :restrict, foreign_key_type: UUID

      add_timestamps
    end
  end

  def rollback
    drop table_for(Subscription)
  end
end
