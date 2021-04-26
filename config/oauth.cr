class GoogleAuthHandler
  if Lucky::Env.production? || Lucky::Env.development?
    MultiAuth.config(
      "google",
      google_key_from_env("GOOGLE_CLIENT_ID"),
      google_key_from_env("GOOGLE_SECRET_KEY")
    )
  end

  def self.authorize_uri(provider : String)
    default_uri = MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").authorize_uri(
      scope: [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/userinfo.profile",
        "https://www.googleapis.com/auth/gmail.labels",
      ].join(" ")
    )

    # Add offline access to obtain a refresh token
    default_uri + "&access_type=offline"
  end

  def self.user(provider : String, params : Enumerable({String, String}))
    MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").user(params)
  end

  private def self.google_key_from_env(key)
    ENV[key]? || raise_missing_key_message(key)
  end

  private def self.raise_missing_key_message(key)
    puts "Missing #{key}. Please set the #{key} ENV var to enable Google logins.".colorize.red
    exit(1)
  end
end
