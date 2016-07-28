module FubClient
  module Middleware
    class Parser < Faraday::Response::Middleware
      
      def on_complete(env)
        original_json = MultiJson.load(env[:body])
        json = original_json.deep_transform_keys{ |k| k.to_s.snakecase.to_sym }
        metadata = json[:_metadata]
        if metadata.nil?
          result = json
        else
          result = json[metadata[:collection].snakecase.to_sym]
        end
        env[:body] = {
          data: result,
          errors: json[:errors],
          metadata: metadata
        }
      end
    end
  end
end
