# WatsonNLPWrapper

[![Build Status](https://travis-ci.org/thededlier/WatsonNLPWrapper.svg?branch=master)](https://travis-ci.org/thededlier/WatsonNLPWrapper)
[![Gem Version](https://badge.fury.io/rb/WatsonNLPWrapper.svg)](https://badge.fury.io/rb/WatsonNLPWrapper)
[rubygems.org/gems/WatsonNLPWrapper](https://rubygems.org/gems/WatsonNLPWrapper)

This is a simple ruby wrapper implementation of IBM's Watson Natural Language Understanding API which is used to analyze text to extract meta-data from content

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'WatsonNLPWrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install WatsonNLPWrapper

## Usage

```ruby
# Require the library
require "WatsonNLPWrapper"

# Initialize
# Version parameter is not needed to be sent and by default is 2018-03-16
nlp = WatsonNLPWrapper::WatsonNLPApi.new('{url}', '{username}', '{password}', '{version}')

# Set sample text
text = '{sample text}'

# Call the analyze API with default features
# This will give a json response
nlp.analyze(text)

# If you want to enable specific features only and not the default features

features =
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

nlp.analyze(text, features)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thededlier/WatsonNLPWrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WatsonNLPWrapper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/thededlier/WatsonNLPWrapper/blob/master/CODE_OF_CONDUCT.md).
