class Filters::New < BrowserAction
  param default_category : UUID?

  get "/filters/new" do
    html Filters::NewPage, operation: SaveFilter.new(category_id: default_category)
  end
end
