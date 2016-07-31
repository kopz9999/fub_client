# FubClient

This gem is a Ruby Client for [Follow Up Boss API](https://api.followupboss.com/api-documentation/)
For more information about Follow Up Boss go to [www.followupboss.com](www.followupboss.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fub_client', '0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fub_client

## Usage

After installing the gem, you can start consuming FUB resources as Rails like 
models with shorthand methods based on [Her](https://github.com/remiprev/her) 
models:

```ruby
# Get one event 
event = FubClient::Event.find 12

# Paginate (offset calculated)
persons = FubClient::Person.by_page 2, 10
# => Her::Model::Relation<Person>

# Total (from all records)
total = FubClient::EmailTemplate.total
# => 323
```

Put your API key in an environment variable named FUB_API_KEY:
```bash
$ export FUB_API_KEY=your_key
```

Or set it up via the client instance:

```ruby
FubClient::Client.instance.api_key = 'your_key'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fub_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

