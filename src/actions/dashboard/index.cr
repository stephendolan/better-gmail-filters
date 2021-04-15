class Dashboard::Index < BrowserAction
  get "/dashboard" do
    HTTP::Client.get "https://gmail.googleapis.com/gmail/v1/users/me/settings/filters"
    html Dashboard::IndexPage
  end
end
