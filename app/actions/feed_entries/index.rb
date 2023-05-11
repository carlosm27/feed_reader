# frozen_string_literal: true
require_relative '../../../lib/feed_reader/feed_service'
module FeedReader
  module Actions
    module FeedEntries
      class Index < FeedReader::Action
        include Feed
        include Deps["persistence.rom"]

        def handle(*, response)
          
          

            def my_feed 
              feed = rom.relations[:feeds]
                .select(:rss)
                .to_a

              hash = feed[0]
              
              rss = hash[:rss].to_s
               
              entry = Feed.new(rss)
              
              entries = entry.get_links
              
               [{
                
                "entries": entries
              }]
              
            end   
          entries = my_feed  
          response.format = :json
          response.body = my_feed.to_json

            


        end
      end
    end
  end
end
