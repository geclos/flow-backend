require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlowBackend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << Rails.root.join('app')

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        hosts = Rails.configuration.hosts.keys
        origins ENV['APP_DOMAIN'], *hosts, *hosts.map { |i| "app.#{i}" }

        resource(
          '*',
          headers: :any,
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: [:get, :post, :options, :delete, :put, :patch],
          credentials: true
        )
      end
    end
  end
end
