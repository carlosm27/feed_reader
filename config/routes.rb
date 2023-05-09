# frozen_string_literal: true

module FeedReader
  class Routes < Hanami::Routes
    root { "Welcome to Feed Reader" }
    get "/feeds/:id", to: "feeds.show"
    get "/feeds", to: "feeds.index"
    post "/feeds", to: "feeds.create"
  end
end
