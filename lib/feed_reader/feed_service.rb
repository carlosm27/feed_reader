require 'rss'
require 'open-uri'


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
            feed.items.each do |item|
                @items = item.title
                return @items
            end
        end
    end
    
    def get_links
        URI.open(@url) do |rss|
            feed = RSS::Parser.parse(rss)
            feed.items.each do |item|
                @links = item.link
                return @links
            end
        end
    end     

end    

feed = Feed.new("https://carlosmv.hashnode.dev/rss.xml")
puts " #{feed.get_items}"