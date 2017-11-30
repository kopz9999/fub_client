module FubClient
  module Middleware
    class Parser < Faraday::Response::Middleware

      def on_complete(env)
        original_json = MultiJson.load(env[:body])
        json = original_json.deep_transform_keys{ |k| string_to_snakecase(k.to_s).to_sym }
        metadata = json[:_metadata]
        if metadata.nil?
          result = json
        else
          result = json[string_to_snakecase(metadata[:collection]).to_sym]
        end
        env[:body] = {
          data: result,
          errors: json[:errors],
          metadata: metadata
        }
      end

      private

      # https://github.com/rubyworks/facets/blob/master/lib/core/facets/string/snakecase.rb#L15
      def string_to_snakecase(string)
        string.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
              .gsub(/([a-z\d])([A-Z])/,'\1_\2')
              .tr('-', '_')
              .gsub(/\s/, '_')
              .gsub(/__+/, '_')
              .downcase
      end
    end
  end
end
