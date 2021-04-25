class Filters::New < BrowserAction
  param default_category : UUID

  get "/filters/new" do
    authorize

    html Filters::NewPage, operation: SaveFilter.new(category_id: default_category, creator: current_user)
  end
end
