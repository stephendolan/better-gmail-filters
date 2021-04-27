class FilterVariants::Replacement
  include JSON::Serializable

  property placeholder : String
  property value : String

  def initialize(@placeholder : String, @value : String)
  end
end
