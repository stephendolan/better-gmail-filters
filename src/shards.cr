# Load .env file before any other config or app code.
require "lucky_env"

# If you use .env files in production or test environments, adjust this accordingly.
LuckyEnv.load(".env") if Lucky::Env.development?

# Require your shards here
require "avram"
require "lucky"
require "carbon"
require "authentic"
require "multi_auth"
require "decorator"
require "pundit"
require "stripe"
require "raven"
require "raven/integrations/lucky"
