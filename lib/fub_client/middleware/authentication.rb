module FubClient
  module Middleware
    class Authentication < Faraday::Middleware
      def call(env)
        api_key = Thread.current[:fub_api_key] || 
          FubClient::Client.instance.api_key
        env[:request_headers]["Authorization"] = "Basic " + 
          Base64.strict_encode64("#{api_key}:")
        @app.call(env)
      end
    end
  end
end
