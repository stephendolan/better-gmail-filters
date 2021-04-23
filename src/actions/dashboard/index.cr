class Dashboard::Index < BrowserAction
  get "/dashboard" do
    html Dashboard::IndexPage, categories: categories
  end

  private def categories
    CategoryQuery.new
      .owner_id(current_user.id)
      .preload_filters(FilterQuery.new.preload_filter_placeholders)
      .label.asc_order
  end
end
