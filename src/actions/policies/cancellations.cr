class Policies::Cancellations < BrowserAction
  get "/cancellations" do
    html Policies::CancellationsPage
  end
end
