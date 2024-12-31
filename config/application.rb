require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoListApi
  class Application < Rails::Application
    config.load_defaults 8.0
    config.api_only = true
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
    config.autoload_lib(ignore: %w[assets tasks])
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:5173"
        resource "*",
                 headers: :any,
                 methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
      end
    end

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: "_todo_list_api_session"
  end
end
