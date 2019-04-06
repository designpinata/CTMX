require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CtmxApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    I18n.enforce_available_locales = false
    I18n.config.available_locales = :es
    config.i18n.default_locale = :es
    config.assets.initialize_on_precompile

    # Adds fonts path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
