class User < BaseModel
  include Carbon::Emailable

  table do
    column email : String
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
