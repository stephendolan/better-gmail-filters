class Google::TokenRefresh
  include JSON::Serializable

  property access_token : String
  property expires_in : Int64
end
