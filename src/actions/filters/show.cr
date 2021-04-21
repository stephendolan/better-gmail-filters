class Filters::Show < BrowserAction
  accepted_formats [:html, :xml], default: :html

  get "/filters/:filter_id" do
    filter = FilterQuery.new.preload_category.find(filter_id)

    html Filters::ShowPage, filter: filter
  end
end
