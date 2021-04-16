class Categories::Delete < BrowserAction
  delete "/categories/:category_id" do
    CategoryQuery.find(category_id).delete
    redirect Home::Index
  end
end
