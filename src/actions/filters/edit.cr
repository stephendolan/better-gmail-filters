class Filters::Edit < BrowserAction
  get "/filters/:filter_id/edit" do
    filter = FilterQuery.find(filter_id)
    html Filters::EditPage,
      operation: SaveFilter.new(filter, creator: current_user),
      filter: filter
  end
end
