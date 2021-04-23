class FilterPlaceholders::Update < BrowserAction
  put "/filter_placeholders/:filter_placeholder_id" do
    placeholder = FilterPlaceholderQuery.new.preload_filter.find(filter_placeholder_id)

    SaveFilterPlaceholder.update(placeholder, params, filter: placeholder.filter) do |operation, updated_filter_placeholder|
      if operation.saved?
        redirect Filters::Show.with(updated_filter_placeholder.filter_id)
      else
        html FilterPlaceholders::EditPage, operation: operation, filter_placeholder: updated_filter_placeholder
      end
    end
  end
end
