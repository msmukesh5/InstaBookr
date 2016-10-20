require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstaBookr
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Kolkata'

    config.active_record.raise_in_transactional_callbacks = true

    config.assets.paths << Rails.root.join('vendor', 'assets', 'components', 'gentelella', 'production','documemtaion')

    config.serve_static_assets = true

  end
end
