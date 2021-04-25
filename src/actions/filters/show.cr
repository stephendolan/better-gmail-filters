class Filters::Show < BrowserAction
  accepted_formats [:html, :xml], default: :html

  get "/filters/:filter_id" do
    filter = FilterQuery.new.preload_category.preload_filter_placeholders.find(filter_id)
    authorize filter

    html Filters::ShowPage, filter: filter
  end
end
