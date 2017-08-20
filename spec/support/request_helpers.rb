# frozen_string_literal: true

module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def json_error
      json_response[:error]
    end

    def json_nested_error
      json_response[:errors][:error]
    end

    def json_root_item(root)
      json_response[root][:id]
    end

    def json_item
      json_response[:id]
    end
  end

  module HeadersHelpers
    def api_header(version = 1)
      request.headers["Accept"] = "application/vnd.finalfurlong.v#{version}"
    end

    # :reek:FeatureEnvy
    def api_response_format(format = Mime[:json])
      headers = request.headers
      headers["Accept"] = "#{headers['Accept']},#{format}"
      headers["Content-Type"] = format.to_s
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
