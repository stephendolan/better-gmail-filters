# Include modules and add methods that are for all API requests
abstract class ApiAction < Lucky::Action
  # APIs typically do not need to send cookie/session data.
  # Remove this line if you want to send cookies in the response header.
  disable_cookies

  accepted_formats [:json]

  # This module provides current_user, sign_in, and sign_out methods
  # Because we only call our API routes for this app from our own interface, we should
  # always have a current_user we can fetch from the session if they exist
  include Authentic::ActionHelpers(User)

  # This method tells Authentic how to find the current user
  private def find_current_user(id) : User?
    UserQuery.new.id(id).first?
  end
end
