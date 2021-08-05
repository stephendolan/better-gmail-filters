BaseEmail.configure do |settings|
  if LuckyEnv.production?
    settings.adapter = Carbon::DevAdapter.new
  elsif LuckyEnv.development?
    settings.adapter = Carbon::DevAdapter.new(print_emails: true)
  else
    settings.adapter = Carbon::DevAdapter.new
  end
end
