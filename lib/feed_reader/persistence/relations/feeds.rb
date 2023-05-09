# lib/feed_reader/persistence/relations/feeds.rb

module FeedReader
    module Persistence
      module Relations
        class Feeds < ROM::Relation[:sql]
          schema(:feeds, infer: true)
        end
      end
    end
  end
  