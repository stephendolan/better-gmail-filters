class Filters::Delete < BrowserAction
  delete "/filters/:filter_id" do
    filter = FilterQuery.find(filter_id)
    authorize filter
    filter.delete
    redirect Home::Index
  end
end
