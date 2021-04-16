class Categories::New < BrowserAction
  get "/categories/new" do
    html Categories::NewPage, operation: SaveCategory.new(current_user: current_user)
  end
end
