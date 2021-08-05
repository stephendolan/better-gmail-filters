class AddIsPublicToFilters::V20210805173109 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Filter) do
      add is_public : Bool, default: false
    end
  end

  def rollback
    alter table_for(Filter) do
      remove :is_public
    end
  end
end
