class Filters::Show < BrowserAction
  include Auth::AllowGuests

  get "/filters/:filter_id" do
    filter = FilterQuery.new.preload_category.find(filter_id)
    authorize filter

    html Filters::ShowPage, filter: filter
  end
end
