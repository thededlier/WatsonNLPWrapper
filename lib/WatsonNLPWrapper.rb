require 'json'
require 'httparty'

require 'WatsonNLPWrapper/version'
require 'WatsonNLPWrapper/constants'

module WatsonNLPWrapper
  class WatsonNLPApi
    include HTTParty
    include WatsonNLPWrapper::Constants
    # Initialize instance variables for use later
    def initialize(url, username, password, version = DEFAULT_VERSION)
      @url = url
      @username = username
      @password = password
      @version = version
    end

    # Sends a POST request to analyze text with certain features enabled
    def analyze(text, features = default_features)
      response = self.class.post(
        "#{@url}/analyze?version=#{@version}",
        body: {
          text: text.to_s,
          features: features
        }.to_json,
        basic_auth: auth,
        headers: {
          "Content-Type" => "application/json"
        }
      )

      response.parsed_response
    end

    # Returns credentials used for basic auth
    def auth
      {
        username: @username,
        password: @password
      }
    end

    # Default features if no features specified
    def default_features
      {
        entities: {
          emotion: true,
          sentiment: true,
          limit: 2
        },
        keywords: {
          emotion: true,
          sentiment: true,
          limit: 2
        }
      }
    end
  end
end
