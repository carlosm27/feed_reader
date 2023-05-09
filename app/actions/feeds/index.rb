# frozen_string_literal: true

require_relative '../../../lib/feed_reader/feed_service'

module FeedReader
  module Actions
    module Feeds
      class Index < FeedReader::Action
        include Feed
        include Deps["persistence.rom"]


        def handle(*, response)
          feed = rom.relations[:feeds]
            .select(:rss)
            .order(:rss)
            .to_a

          
          response.format = :json
          response.body = feed.to_json
        end
      end
    end
  end
end
