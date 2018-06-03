require "WatsonNLPWrapper/version"
require 'json'
require 'httparty'

module WatsonNLPWrapper
  class WatsonNLPApi
    include HTTParty

    # Initialize instance variables for use later
    def initialize(url, username, password, version)
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
