class CreateCategories::V20210416024853 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Category) do
      primary_key id : UUID
      add_timestamps
      add label : String
      add_belongs_to owner : User, on_delete: :cascade, foreign_key_type: UUID
    end
  end

  def rollback
    drop table_for(Category)
  end
end
