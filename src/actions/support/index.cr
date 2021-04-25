class Support::Index < BrowserAction
  get "/support" do
    html Support::IndexPage
  end
end
