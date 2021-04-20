class SaveFilter < Filter::SaveOperation
  permit_columns name, search_query, category_id
end
