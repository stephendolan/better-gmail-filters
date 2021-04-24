class Subscriptions::Index < BrowserAction
  include Auth::AllowGuests

  get "/pricing" do
    html Subscriptions::IndexPage
  end
end
