# frozen_string_literal: true

require_relative "lib/application_service/version"

Gem::Specification.new do |spec|
  spec.name = "rails_application_service"
  spec.version = ApplicationService::VERSION
  spec.authors = ["Mário Marroquim"]
  spec.email = ["mariomarroquim@gmail.com"]
  spec.summary = "Service objects for Rails - the Rails way."
  spec.description = "This Ruby gem adds service objects to Rails applications."
  spec.homepage = "https://github.com/mariomarroquim/rails_application_service"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.2"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/mariomarroquim/rails_application_service/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activemodel", ">= 4.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
