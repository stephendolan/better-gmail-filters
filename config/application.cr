class Application
  Habitat.create do
    setting name : String
    setting support_email : String
  end
end

Application.configure do |settings|
  settings.name = "Better Gmail Filters"
  settings.support_email = "help@better_gmail_filters.com"
end
