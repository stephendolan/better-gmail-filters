class FilterPlaceholders::Edit < BrowserAction
  get "/filter_placeholders/:filter_placeholder_id/edit" do
    placeholder = FilterPlaceholderQuery.new.preload_filter.find(filter_placeholder_id)

    html FilterPlaceholders::EditPage,
      operation: SaveFilterPlaceholder.new(placeholder, filter: placeholder.filter),
      filter_placeholder: placeholder
  end
end
