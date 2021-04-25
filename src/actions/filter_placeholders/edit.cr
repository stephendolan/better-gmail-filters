class FilterPlaceholders::Edit < BrowserAction
  get "/filter_placeholders/:filter_placeholder_id/edit" do
    placeholder = FilterPlaceholderQuery.new.preload_filter.find(filter_placeholder_id)
    authorize placeholder

    html FilterPlaceholders::EditPage,
      operation: SaveFilterPlaceholder.new(placeholder, filter: placeholder.filter, current_user: current_user),
      filter_placeholder: placeholder
  end
end
