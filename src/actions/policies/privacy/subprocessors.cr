class Policies::Privacy::Subprocessors < BrowserAction
  include Auth::AllowGuests

  get "/privacy/subprocessors" do
    html Policies::Privacy::SubprocessorsPage
  end
end
