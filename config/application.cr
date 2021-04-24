class Application
  Habitat.create do
    setting name : String
    setting domain : String
    setting support_email : Carbon::Address
  end
end

Application.configure do |settings|
  settings.name = "Better Gmail Filters"
  settings.domain = "bettergmailfilters.com"
  settings.support_email = Carbon::Address.new(settings.name, "support@bettergmailfilters.com")
end
