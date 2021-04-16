class Categories::Edit < BrowserAction
  get "/categories/:category_id/edit" do
    category = CategoryQuery.find(category_id)
    html Categories::EditPage,
      operation: SaveCategory.new(category, current_user: current_user),
      category: category
  end
end
