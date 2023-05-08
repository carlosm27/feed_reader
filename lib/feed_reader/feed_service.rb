require 'rss'
require 'open-uri'

module Feed
    class Feed 
        
        def initialize(url)
            @url = url
        end    

        def get_title
            URI.open(@url) do |rss|
                feed = RSS::Parser.parse(rss)
                @title = feed.channel.title
                return @title
            end
        end
        
        def get_items 
            URI.open(@url) do |rss|
                feed = RSS::Parser.parse(rss)
                list_items = []
                feed.items.each do |item|
                    list_items << item.title
                end
                return list_items
                
            end
        end
        
        def get_links
            URI.open(@url) do |rss|
                feed = RSS::Parser.parse(rss)
                array_links = []
                feed.items.each do |item|
                    title = item.title
                    link = item.link
                    array_links << {title:title, link: link}
                    
                end
                return array_links
            end
        end     

    end    
end
