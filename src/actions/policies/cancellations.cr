class Policies::Cancellations < BrowserAction
  include Auth::AllowGuests

  get "/cancellations" do
    html Policies::CancellationsPage
  end
end
