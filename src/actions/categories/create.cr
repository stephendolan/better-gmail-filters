class Categories::Create < BrowserAction
  post "/categories" do
    SaveCategory.create(params, current_user: current_user) do |operation, category|
      if category
        redirect Home::Index
      else
        html Categories::NewPage, operation: operation
      end
    end
  end
end
