class Filters::Show < BrowserAction
  get "/filters/:filter_id" do
    html Filters::ShowPage, filter: FilterQuery.find(filter_id)
  end
end
