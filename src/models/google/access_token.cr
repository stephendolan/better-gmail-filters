class Google::AccessToken
  getter user : User
  getter value : String

  def initialize(@user : User)
    @value = @user.google_access_token

    if @user.google_access_token_expires_at < Time.utc
      @value = @user.refresh_google_access_token
    end
  end
end
