require "WatsonNLPWrapper/version"
require 'json'
require 'httparty'

module WatsonNLPWrapper
  class WatsonNLPApi
    include HTTParty

    def initialize(url, username, password, version='2018-03-16')
      @url = url
      @username = username
      @password = password
      @version = version
    end

    def analyze(text, features)
      response = self.class.post(
        "#{@url}/analyze?version=#{@version}",
        :query => {
          :text => "#{text}",
          :features => features
        },
        :basic_auth => auth,
        :headers => {
          "Content-Type" => "application/json"
        }
      )

      response.parsed_response
    end

    def auth
      {
        :username => @username,
        :password => @password
      }
    end
  end
end
