RSpec.describe WatsonNLPWrapper do
  before do
    @test_url = ENV['WATSON_URL']
    @test_username = ENV['WATSON_USERNAME']
    @test_password = ENV['WATSON_PASSWORD']
    @test_version = '2017-02-27'
  end
  it "has a version number" do
    expect(WatsonNLPWrapper::VERSION).not_to be nil
  end

  it "should initialize correctly when correct parameters are passed" do
    nlp = WatsonNLPWrapper::WatsonNLPApi.new(@test_url, @test_username, @test_password, @test_version)
    expect(nlp.instance_variable_get(:@url)).to eq @test_url
    expect(nlp.instance_variable_get(:@username)).to eq @test_username
    expect(nlp.instance_variable_get(:@password)).to eq @test_password
    expect(nlp.instance_variable_get(:@version)).to eq @test_version
  end

  it "should initialize with default version if no version is passed" do
    nlp = WatsonNLPWrapper::WatsonNLPApi.new(@test_url, @test_username, @test_password)
    expect(nlp.instance_variable_get(:@url)).to eq @test_url
    expect(nlp.instance_variable_get(:@username)).to eq @test_username
    expect(nlp.instance_variable_get(:@password)).to eq @test_password
    expect(nlp.instance_variable_get(:@version)).to eq WatsonNLPWrapper::Constants::DEFAULT_VERSION
  end
end
