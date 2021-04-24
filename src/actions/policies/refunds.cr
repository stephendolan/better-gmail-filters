class Policies::Refunds < BrowserAction
  get "/refunds" do
    html Policies::RefundsPage
  end
end
