class CreateFilters::V00000000000020 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Filter) do
      # Core filter attributes
      primary_key id : UUID
      add_timestamps
      add name : String
      add search_query : String
      add_belongs_to category : Category, on_delete: :cascade, foreign_key_type: UUID
      add_belongs_to creator : User, on_delete: :cascade, foreign_key_type: UUID

      # Filter actions
      add should_mark_as_read : Bool, default: false
      add should_archive : Bool, default: false
      add should_star : Bool, default: false
      add should_never_mark_spam : Bool, default: false
      add should_mark_important : Bool, default: false
      add should_forward_to : String?
      add should_apply_label : String?
    end
  end

  def rollback
    drop table_for(Filter)
  end
end
