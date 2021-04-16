class Categories::Update < BrowserAction
  put "/categories/:category_id" do
    category = CategoryQuery.find(category_id)
    SaveCategory.update(category, params, current_user: current_user) do |operation, updated_category|
      if operation.saved?
        redirect Home::Index
      else
        html Categories::EditPage, operation: operation, category: updated_category
      end
    end
  end
end
