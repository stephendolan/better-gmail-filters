class Application
  Habitat.create do
    setting name : String
    setting domain : String
    setting support_email : Carbon::Address
    setting twitter_handle : String
    setting company_name : String
  end
end

Application.configure do |settings|
  settings.name = "Better Gmail Filters"
  settings.domain = "bettergmailfilters.com"
  settings.support_email = Carbon::Address.new(settings.name, "support@bettergmailfilters.com")
  settings.twitter_handle = "GmailFiltersApp"
  settings.company_name = "LuckyCasts, LLC"
end
