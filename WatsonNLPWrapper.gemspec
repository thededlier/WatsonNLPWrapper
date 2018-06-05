
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "WatsonNLPWrapper/version"

Gem::Specification.new do |spec|
  spec.name          = "WatsonNLPWrapper"
  spec.version       = WatsonNLPWrapper::VERSION
  spec.authors       = ["Rohan Anand"]
  spec.email         = ["thededlier@gmail.com"]

  spec.summary       = %q{Wrapper for IBM's Watson Natural Language Understanding API}
  spec.description   = %q{A simple wrapper implementation of IBM's Watson Natural Language Understanding API which is used to analyze text to extract meta-data from content}
  spec.homepage      = "https://github.com/thededlier/WatsonNLPWrapper.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'httparty', '~> 0.13.7'
  spec.add_dependency 'json', '~> 1.8'
end
