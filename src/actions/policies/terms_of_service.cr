class Policies::TermsOfService < BrowserAction
  include Auth::AllowGuests

  get "/terms" do
    html Policies::TermsOfServicePage
  end
end
