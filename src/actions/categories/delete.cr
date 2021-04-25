class Categories::Delete < BrowserAction
  delete "/categories/:category_id" do
    category = CategoryQuery.find(category_id)
    authorize category

    category.delete
    redirect Home::Index
  end
end
