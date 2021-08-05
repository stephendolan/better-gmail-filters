# Load .env file before any other config or app code.
require "lucky_env"

LuckyEnv.load?(".env")

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
