class CreateFilterVariants::V20210426202102 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(FilterVariant) do
      primary_key id : UUID
      add replacements : JSON::Any
      add_belongs_to filter : Filter, on_delete: :cascade, foreign_key_type: UUID
      add_timestamps
    end
  end

  def rollback
    drop table_for(FilterVariant)
  end
end
