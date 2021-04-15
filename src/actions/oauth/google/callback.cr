class OAuth::Google::Callback < BrowserAction
  include Auth::AllowGuests

  get "/oauth/google/callback" do
    google_user = GoogleAuthHandler.user("google", request.query_params)

    if (user = UserQuery.new.google_id(google_user.uid).first?)
      sign_in(update_user_from_google(user, google_user))

      flash.success = "Authentication with Google successful. Welcome back!"
      redirect Home::Index
    else
      sign_in(new_user_from_google(google_user))

      flash.success = "Your account was created. Welcome to #{Application.settings.name}!"
      redirect Home::Index
    end
  rescue exception
    Raven.extra_context(request_query_params: request.query_params.to_h)

    if google_user
      Raven.extra_context(google_user: google_user.raw_json)
    end

    Raven.capture(exception)

    flash.failure = "Well, that's embarrassing... we couldn't sign you up, but we're on the case!"
    redirect Home::Index
  end

  # The only thing we do differently for new User creation is adding an email.
  private def new_user_from_google(google_user : MultiAuth::User) : User
    team = SaveTeam.create!(name: "Personal")

    SaveUser.create!(
      **default_google_user_params(google_user),
      email: google_user.email.not_nil!,
      team_id: team.id
    )
  end

  # Updates a user from google, containing everything *except* the email address.
  private def update_user_from_google(user : User, google_user : MultiAuth::User) : User
    SaveUser.update!(
      user,
      **default_google_user_params(google_user)
    )
  end

  private def default_google_user_params(google_user : MultiAuth::User) : NamedTuple
    {
      google_id:                      account_id_from_people_api_response(google_user.uid),
      google_access_token:            google_user.access_token.access_token,
      google_access_token_expires_at: Time.utc + google_user.access_token.expires_in.seconds,
      google_refresh_token:           google_user.extra.refresh_token,
      first_name:                     google_user.first_name,
      last_name:                      google_user.last_name,
      image_url:                      google_user.image,
    }
  end

  # Google sends UIDs back for OAuth calls like this:
  # "people/12312412412412412124"
  #
  # We just want the numbers for our account ID, so we grab the last part of the string.
  #
  # Example:
  # ```
  # original_id = "people/1231231241241241"
  # account_id_from_people_api_response(original_id) # => "1231231241241241"
  # ```
  private def account_id_from_people_api_response(full_id : String) : String
    full_id.split("/").last
  end
end
