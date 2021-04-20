class CreateFilters::V00000000000020 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Filter) do
      primary_key id : UUID
      add_timestamps
      add name : String
      add search_query : String
      add_belongs_to category : Category?, on_delete: :nullify, foreign_key_type: UUID
    end
  end

  def rollback
    drop table_for(Filter)
  end
end
