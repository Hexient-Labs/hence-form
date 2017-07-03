require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HenceForm
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Use Sidekiq
    config.active_job.queue_adapter = :sidekiq

    # Always set host from ENV
    Rails.application.routes.default_url_options[:host] = ENV["HOST"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += Dir[Rails.root.join("app", "services", "{**}")]
  end
end
