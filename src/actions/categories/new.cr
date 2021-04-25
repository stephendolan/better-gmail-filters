class Categories::New < BrowserAction
  get "/categories/new" do
    authorize

    html Categories::NewPage, operation: SaveCategory.new(current_user: current_user)
  end
end
