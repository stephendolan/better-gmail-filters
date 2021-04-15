class OAuth::Google::Callback < BrowserAction
  include Auth::AllowGuests

  get "/oauth/google/callback" do
    google_user = GoogleAuthHandler.user("google", request.query_params)

    if (user = UserQuery.new.google_id(google_user.uid).first?)
      sign_in(user)

      flash.success = "Authentication with Google successful. Welcome back!"
      redirect Home::Index
    else
      sign_in(new_user_from(google_user))

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

  private def new_user_from(google_user : MultiAuth::User) : User
    SaveUser.create!(
      email: google_user.email.not_nil!,
      google_id: google_user.uid,
      first_name: google_user.first_name,
      last_name: google_user.last_name,
      image_url: google_user.image,
    )
  end
end
