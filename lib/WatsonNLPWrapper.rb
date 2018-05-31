require "WatsonNLPWrapper/version"

module WatsonNLPWrapper
  class WatsonNLPApi
    def initialize(url, username, password)
      @url = url
      @username = username
      @password = password
    end
  end
end
