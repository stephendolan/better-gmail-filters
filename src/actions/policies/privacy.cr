class Policies::Privacy < BrowserAction
  include Auth::AllowGuests

  get "/privacy" do
    html Policies::PrivacyPage
  end
end
