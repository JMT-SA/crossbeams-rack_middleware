# Crossbeams::RackMiddleware

Rack Middleware for use by the Crossbeams framework.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crossbeams-rack_middleware'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crossbeams-rack_middleware

## Usage

### Banner

Use this to provide an ERB partial that can be used by mounted apps.

In `config.ru` use the middleware and provide the path to the erb template that will be used :

```ruby
use Crossbeams::RackMiddleware::Banner, template: 'lib/banner_template.erb'
```

Write the contents of the template to be passed through ERB (`lib/banner_template.erb` in the example above):

```html
<h1><a href="/">Home</a></h1>
<p>Time is <%= Time.now %></p>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/crossbeams-rack_middleware.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

