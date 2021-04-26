module Users::GoogleAuthenticatable
  macro included
    column google_id : String
    column google_access_token : String
    column google_access_token_expires_at : Time
    column google_refresh_token : String
  end

  # Access tokens expire after a given amount of time.
  # This method updates the access token and expiration time for the user.
  def refresh_google_access_token : String
    refresh_request_parts = [
      "client_id=#{MultiAuth.configuration.dig("google", 0)}",
      "client_secret=#{MultiAuth.configuration.dig("google", 1)}",
      "refresh_token=#{google_refresh_token}",
      "grant_type=refresh_token",
    ]

    form = refresh_request_parts.join("&")

    response = HTTP::Client.post("https://oauth2.googleapis.com/token", form: form)
    response = Google::TokenRefresh.from_json(response.body)

    SaveUser.update!(
      self,
      google_access_token: response.access_token,
      google_access_token_expires_at: Time.utc + response.expires_in.seconds
    )

    response.access_token
  end
end
