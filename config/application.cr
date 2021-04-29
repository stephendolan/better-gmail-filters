class Application
  Habitat.create do
    setting name : String
    setting description : String
    setting domain : String
    setting support_email : Carbon::Address
    setting twitter_handle : String
    setting company_name : String
  end
end

Application.configure do |settings|
  settings.name = "Better Gmail Filters"
  settings.description = "Gmail's filter interface sucks, so we made it better! Level up your email automation game with dynamic filters to make sure nothing falls through the cracks."
  settings.domain = "bettergmailfilters.com"
  settings.support_email = Carbon::Address.new(settings.name, "support@bettergmailfilters.com")
  settings.twitter_handle = "GmailFiltersApp"
  settings.company_name = "LuckyCasts, LLC"
end
