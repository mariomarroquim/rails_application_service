# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :spec do
  desc "Run specs against the minimum supported ActiveModel version"
  task :minimum do
    Bundler.with_unbundled_env do
      gemfile = File.expand_path("gemfiles/activemodel_8_0.gemfile", __dir__)
      sh({ "BUNDLE_GEMFILE" => gemfile }, "bundle install --quiet && bundle exec rspec")
    end
  end
end
