class Stripe
  Habitat.create do
    setting api_key : String
    setting webhook_signing_secret : String
  end
end

Stripe.configure do |settings|
  if Lucky::Env.test?
    settings.api_key = "unused"
    settings.webhook_signing_secret = "unused"
  else
    settings.api_key = stripe_setting_from_env("STRIPE_API_KEY")
    settings.webhook_signing_secret = stripe_setting_from_env("STRIPE_WEBHOOK_SIGNING_SECRET")
  end
end

Stripe.api_key = Stripe.settings.api_key

private def stripe_setting_from_env(key)
  ENV[key]? || raise_missing_key_message(key)
end

private def raise_missing_key_message(key)
  puts "Missing #{key}. Set the #{key} env variable to 'unused' if you're not processing payments, or set the #{key} ENV var.".colorize.red
  exit(1)
end
