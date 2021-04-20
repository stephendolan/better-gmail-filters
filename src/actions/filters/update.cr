class Filters::Update < BrowserAction
  put "/filters/:filter_id" do
    filter = FilterQuery.find(filter_id)
    SaveFilter.update(filter, params) do |operation, updated_filter|
      if operation.saved?
        redirect Show.with(updated_filter.id)
      else
        html Filters::EditPage, operation: operation, filter: updated_filter
      end
    end
  end
end
