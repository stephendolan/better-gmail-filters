class Google::Label
  include JSON::Serializable

  enum Type
    User
    System
  end

  property id : String
  property name : String
  property type : Google::Label::Type
end
