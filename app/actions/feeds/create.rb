# frozen_string_literal: true

module FeedReader
  module Actions
    module Feeds
      class Create < FeedReader::Action
        include Deps["persistence.rom"]
        

        params do
          required(:feed).hash do
            required(:rss).filled(:string)
          end
        end    

        def handle(request, response)
          
          if request.params.valid?
            feed = rom.relations[:feeds].changeset(:create, request.params[:feed]).commit
            
            response.status = 201
            response.body = feed.to_json
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end    
        end
      end
    end
  end
end
