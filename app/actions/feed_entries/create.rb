# frozen_string_literal: true

module FeedReader
  module Actions
    module FeedEntries
      class Create < FeedReader::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
