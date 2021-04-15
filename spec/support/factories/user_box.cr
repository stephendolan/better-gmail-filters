class UserFactory < Avram::Factory
  def initialize
    email "#{sequence("test-email")}@example.com"
  end
end
