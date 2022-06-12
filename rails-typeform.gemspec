require_relative "lib/rails/typeform/version"

Gem::Specification.new do |spec|
  spec.name        = "rails-typeform"
  spec.version     = Rails::Typeform::VERSION
  spec.authors     = ["Daniel Sjöblom"]
  spec.email       = ["daniel@ziney.co"]
  spec.homepage    = "https://ziney.co"
  spec.summary     = "Summary of Rails::Typeform."
  spec.description = "Description of Rails::Typeform."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dssjoblom/rails-typeform"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.5", ">= 6.1.5.1"
  spec.add_dependency "browser"
end
