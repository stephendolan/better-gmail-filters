# Defines a wrapper that sanitizes a MultiAuth::User sent from Google.
#
# Because of our scopes, we're able to make some assumptions about the response format.
class OAuth::GoogleUser
  getter id : String
  getter email : String
  getter first_name : String?
  getter last_name : String?
  getter image : String?
  getter access_token : String
  getter access_token_expiration_time : Time
  getter refresh_token : String

  def initialize(user : MultiAuth::User)
    @id = account_id_from_uid(user.uid)

    if (user_email = user.email)
      @email = user_email
    else
      raise "Expected OAuth user email from Google."
    end

    @first_name = user.first_name
    @last_name = user.last_name
    @image = user.image

    oauth = user.access_token
    if oauth.is_a? OAuth2::AccessToken
      if (user_refresh_token = oauth.refresh_token)
        @refresh_token = user_refresh_token
      else
        raise "Expected OAuth refresh token from Google."
      end

      @access_token = oauth.access_token

      if (token_expires_in = oauth.expires_in)
        @access_token_expiration_time = Time.utc + token_expires_in.seconds
      else
        raise "Expected OAuth access token expiration data from Google."
      end
    else
      raise "Expected OAuth2 token from Google."
    end
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
  private def account_id_from_uid(uid : String) : String
    uid.split("/").last
  end
end
