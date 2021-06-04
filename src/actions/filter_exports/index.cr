class FilterExports::Index < BrowserAction
  get "/filters/export" do
    html FilterExports::IndexPage
  end
end
