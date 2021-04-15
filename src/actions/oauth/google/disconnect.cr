class OAuth::Google::Disconnect < BrowserAction
  include Auth::RequireSignIn

  put "/oauth/google/disconnect" do
    redirect google_application_management_link
  end

  private def google_application_management_link
    "https://myaccount.google.com/permissions"
  end
end
