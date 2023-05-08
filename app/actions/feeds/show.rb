# frozen_string_literal: true

module FeedReader
  module Actions
    module Feeds
      class Show < FeedReader::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
