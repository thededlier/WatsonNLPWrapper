require "WatsonNLPWrapper/version"
require 'json'
require 'httparty'

module WatsonNLPWrapper
  class WatsonNLPApi
    include HTTParty

    def initialize(url, username, password, version)
      @url = url
      @username = username
      @password = password
      @version = version
    end

    def analyze(text, features = default_features)
      response = self.class.post(
        "#{@url}/analyze?version=#{@version}",
        body: {
          text: "#{text}",
          features: features
        }.to_json,
        basic_auth: auth,
        headers: {
          "Content-Type" => "application/json"
        }
      )

      response.parsed_response
    end

    def auth
      {
        username: @username,
        password: @password
      }
    end

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
