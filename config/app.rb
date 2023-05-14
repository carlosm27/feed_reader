# frozen_string_literal: true

require "hanami"
require "rack/cors"

module FeedReader
  class App < Hanami::App
    config.middleware.use :body_parser, :json
    
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :patch, :put]
      end
    end
  end
end
