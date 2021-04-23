class CreateFilterPlaceholders::V20210422214149 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(FilterPlaceholder) do
      primary_key id : UUID
      add_timestamps
      add name : String
      add values : Array(String)
      add_belongs_to filter : Filter, on_delete: :cascade, foreign_key_type: UUID
    end

    # There should not be a duplicate placeholder for a given filter.
    create_index :filter_placeholders, [:filter_id, :name], unique: true
  end

  def rollback
    drop table_for(FilterPlaceholder)
  end
end
