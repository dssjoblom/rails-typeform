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

In your `application.html.erb` (or other suitable template):

```
<%= render partial: 'layouts/rails/typeform/feedback_form' %>
```

Include CSS:

In `app/assets/config/manifest.js`:

```
//= link rails/typeform/application.css
```

In your `application.html.erb` (or other suitable template):

```
<%= stylesheet_link_tag "rails/typeform/application.css", "data-turbo-track": "reload" %>
```

After this, simply add the correct configuration to the database
as described in the next section and voila, the form will be rendered correctly.

## Configuration

The available TypeForms, and the pages which they are rendered on are
configured via the `Rails::Typeform::FeedbackForm` model.

For basic use, specify the following fields:

- `language: '*'` (form is displayed for any I18n.locale)
- `trigger: '*/*:load'` (form is displayed for any controller action)
- `typeform_id: YOUR_ID_GOES_HERE` (input the id of your typeform here)

Try this in your `rails console` for a sample form:

```
Rails::Typeform::FeedbackForm.create(language: '*', trigger: '*/*:load', typeform_id: "RFXNBcWD")
```

For production use, substitute your own TypeForms.

## Customization

You can change the button color via a CSS variable:

```
:root {
  --rails-typeform-button-bg: #acbeff;
}
```

## Contributing

Send me a pull request and I'll see what I can do to integrate it.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
