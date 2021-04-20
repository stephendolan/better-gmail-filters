class Filters::Delete < BrowserAction
  delete "/filters/:filter_id" do
    FilterQuery.find(filter_id).delete
    redirect Home::Index
  end
end
