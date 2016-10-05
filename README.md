# Dighasher

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dighasher`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem provide generate hash method.
Hash algorithm, MD5, SHA1, SHA2(256, 384, 512).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dighasher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dighasher

## Usage

This sample generate hash by MD5.

```ruby
require 'dighasher'

generator = Dighasher::Generator.new(Dighasher::DigestGenerator::MD5, "hash target string.")

# generate hash.
hash = generator.generate_hash
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koyupi/dighasher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

