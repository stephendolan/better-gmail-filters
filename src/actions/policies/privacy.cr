class Policies::Privacy < BrowserAction
  get "/privacy" do
    html Policies::PrivacyPage
  end
end
