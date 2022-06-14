# Rails::Typeform

A simple gem for embedding Typeform forms into Rails templates.

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

## Usage

Install migrations and run them:

```
bin/rails rails_typeform:install:migrations
bin/rails db:migrate
```

In your application.html.erb (or other suitable template):

```
<%= render partial: 'layouts/rails/typeform/feedback_form' %>
```

Include CSS:

In `app/assets/config/manifest.js`:

```
//= link rails/typeform/application.css
```

In your application.html.erb (or other suitable template):

```
<%= stylesheet_link_tag "rails/typeform/application.css", "data-turbo-track": "reload" %>
```

After this, simply add the correct configuration to the database
and voila, the form will be rendered correctly.

## Contributing

Send me a pull request and I'll see what I can do to integrate it.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
