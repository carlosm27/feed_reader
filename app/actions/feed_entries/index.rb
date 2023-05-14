# frozen_string_literal: true
require_relative '../../../lib/feed_reader/feed_service'
module FeedReader
  module Actions
    module FeedEntries
      class Index < FeedReader::Action
        include Feed
        include Deps["persistence.rom"]

        def my_feed 
          feed = rom.relations[:feeds]
            .select(:rss)
            .to_a
          
          array_entries = []  

          feed.each do |element|
            rss = element[:rss].to_s
            
            entry = Feed.new(rss)
          
            entries = entry.get_links
            
            array_entries << entries
            
          end   
            
          
              
          array_entries
          
    
        end   

        def handle(*, response)
     
          entries = my_feed  
          response.format = :json
          response.body = my_feed.to_json
        end
      end
    end
  end
end
