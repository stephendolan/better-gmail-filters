class Policies::Refunds < BrowserAction
  include Auth::AllowGuests

  get "/refunds" do
    html Policies::RefundsPage
  end
end
