# Rails::Typeform
Short description and motivation.

## Usage
How to use my plugin.

Install migrations and run them:

```
bin/rails rails_typeform:install:migrations
```

In your ApplicationController:

```ruby
include Rails::Typeform::Controller
```

In your application.html.erb:

```
<%= render partial: 'layouts/rails/typeform/feedback_form' %>
```

After this, simply add the correct configuration to the database
and voila, the form will be rendered correctly.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails-typeform'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails-typeform
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
