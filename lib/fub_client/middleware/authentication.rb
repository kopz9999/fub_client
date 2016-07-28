module FubClient
  module Middleware
    class Authentication < Faraday::Middleware
      def call(env)
        env[:request_headers]["Authorization"] = "Basic " + 
          Base64.strict_encode64("#{FubClient::Client.instance.api_key}:")
        @app.call(env)
      end
    end
  end
end
