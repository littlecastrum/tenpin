# Tenpin

This is a CLI gem to parse files with a list of scores for a game of Ten Pin Bowling. The parser is consumed by a table
gem that outputs a Scoreboard with all `pinfalls` & `scores` by frame divided by player that participated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tenpin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tenpin

## Usage

To use execute the following after installation:

    $ tenpin parse FILE_PATH

File paths can be relative or precise (ex: `../../file` is a valid file path for the gem)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/littlecastrum/tenpin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
