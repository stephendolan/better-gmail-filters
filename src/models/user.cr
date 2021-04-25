class User < BaseModel
  include Carbon::Emailable

  table do
    column email : String

    column google_id : String
    column google_access_token : String
    column google_access_token_expires_at : Time
    column google_refresh_token : String

    column first_name : String?
    column last_name : String?
    column image_url : String?

    has_many team_users : TeamUser
    has_many teams : Team, through: [:team_users, :team]

    has_many categories : Category, foreign_key: :owner_id
    has_many filters : Filter, through: [:categories, :filters]
  end

  def full_name : String?
    return nil unless first_name || last_name

    [first_name, last_name].compact.join(" ")
  end

  # While the Team schema structure supports many teams, we only functionally
  # use a "Personal" team for each user at the moment. This provides a convenient
  # shortcut that we can use because of this intentional limitation.
  def subscription : Subscription?
    teams.first.subscription
  end

  # Since Google might not have an image URL, fall back to Gravatar.
  #
  # Defaults to size of 100 to match the default Google image URL size.
  def image : String
    if (stored_image_url = image_url)
      stored_image_url
    else
      gravatar_base_url = "https://gravatar.com/avatar/"
      hash = Digest::MD5.hexdigest(email.downcase)
      params = "?s=100&d=identicon"

      gravatar_base_url + hash + params
    end
  end

  def emailable : Carbon::Address
    Carbon::Address.new(full_name, email)
  end
end
