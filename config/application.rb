require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EdamamAPI
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)
    config.generators do |g|
      g.test_framework :minitest, spec: true
      g.javascript_engine :js
    end

    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # Automatically load all code from <rails_root>/lib
    # config.autoload_paths << Rails.root.join('lib')
  end
end
