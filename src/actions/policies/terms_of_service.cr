class Policies::TermsOfService < BrowserAction
  get "/terms" do
    html Policies::TermsOfServicePage
  end
end
