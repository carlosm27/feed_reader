# frozen_string_literal: true

require_relative '../../../lib/feed_reader/feed_service'

module FeedReader
  module Actions
    module Feeds
      class Index < FeedReader::Action
        include Feed

        
         
        
        
        def my_feed 
          feed = Feed.new("https://carlosmv.hashnode.dev/rss.xml")
          title = feed.get_title
          entries = feed.get_links
          
           [{
            "author": "Carlos Marcano",
            "title": title,
            "entries": entries
          }]
          
        end  

        def handle(*, response)
          feed = my_feed
          response.body = feed.to_json
        end
      end
    end
  end
end
