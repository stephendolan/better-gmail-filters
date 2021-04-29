class Support::Index < BrowserAction
  include Auth::AllowGuests

  get "/support" do
    html Support::IndexPage
  end
end
