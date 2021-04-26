class Google::LabelList
  include JSON::Serializable

  property labels : Array(Google::Label)

  def self.for(user : User)
    client = HTTP::Client.new("gmail.googleapis.com", tls: true)
    client.before_request do |request|
      request.headers["Authorization"] = "Bearer #{Google::AccessToken.new(user).value}"
    end

    response = client.get "/gmail/v1/users/me/labels"
    from_json(response.body).user_labels
  end

  def user_labels
    labels.select { |label| label.type == Google::Label::Type::User }.sort_by!(&.name)
  end

  def system_labels
    labels.select { |label| label.type == Google::Label::Type::System }.sort_by!(&.name)
  end
end
