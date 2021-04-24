class Policies::Privacy::Subprocessors < BrowserAction
  get "/privacy/subprocessors" do
    html Policies::Privacy::SubprocessorsPage
  end
end
