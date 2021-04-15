class OAuth::Google::Connect < BrowserAction
  include Auth::AllowGuests
  include Auth::RedirectSignedInUsers

  get "/oauth/google/connect" do
    redirect to: GoogleAuthHandler.authorize_uri("google")
  end
end
