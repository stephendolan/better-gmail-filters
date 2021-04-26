class OAuth::Google::Callback < BrowserAction
  include Auth::AllowGuests

  get "/oauth/google/callback" do
    multiauth_google_user = GoogleAuthHandler.user("google", request.query_params)
    google_user = OAuth::GoogleUser.new(multiauth_google_user)

    if (user = UserQuery.new.google_id(google_user.id).first?)
      sign_in(update_user_from_google(user, google_user))

      flash.success = "Welcome back!"
      redirect Home::Index
    else
      sign_in(new_user_from_google(google_user))

      flash.success = "Your account was created. Welcome to #{Application.settings.name}!"
      redirect Home::Index
    end
  rescue exception
    Raven.extra_context(request_query_params: request.query_params.to_h)

    if multiauth_google_user
      Raven.extra_context(google_user: multiauth_google_user.raw_json)
    end

    Raven.capture(exception)

    flash.failure = "Well, that's embarrassing... we couldn't sign you up, but we're on the case!"
    redirect Home::Index
  end

  # The only thing we do differently for new User creation is adding an email and refresh token.
  private def new_user_from_google(google_user : GoogleUser) : User
    unless (refresh_token = google_user.refresh_token)
      raise "New users must have OAuth refresh token from Google."
    end

    team = SaveTeam.create!(name: "Personal")

    user = SaveUser.create!(
      **default_google_user_params(google_user, refresh_token),
      email: google_user.email,
    )

    SaveTeamUser.create!(
      team_id: team.id,
      user_id: user.id,
      is_admin: true,
    )

    user
  end

  # Updates a user from google, containing everything *except* the email address.
  private def update_user_from_google(user : User, google_user : GoogleUser) : User
    refresh_token = google_user.refresh_token || user.google_refresh_token

    SaveUser.update!(
      user,
      **default_google_user_params(google_user, refresh_token),
    )
  end

  private def default_google_user_params(google_user : GoogleUser, refresh_token : String) : NamedTuple
    {
      google_id:                      google_user.id,
      google_refresh_token:           refresh_token,
      google_access_token:            google_user.access_token,
      google_access_token_expires_at: google_user.access_token_expiration_time,
      first_name:                     google_user.first_name,
      last_name:                      google_user.last_name,
      image_url:                      google_user.image,
    }
  end
end
