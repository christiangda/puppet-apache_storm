source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.8']

group :test do
  gem 'rake'
  gem 'puppet', puppetversion
  gem 'puppet-syntax'
  gem 'puppet-lint'
  gem 'puppet-doc-lint'
  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-puppet'
  gem 'rspec-puppet-facts'
  gem 'rspec-puppet-utils'
  gem 'puppet-lint-absolute_classname-check'
  gem 'puppet-lint-leading_zero-check'
  gem 'puppet-lint-trailing_comma-check'
  gem 'puppet-lint-version_comparison-check'
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
  gem 'puppet-lint-unquoted_string-check'
  gem 'puppet-lint-variable_contains_upcase'
  gem 'metadata-json-lint'
  gem 'puppetlabs_spec_helper'
  gem 'json_pure', '<= 2.0.1', require: false if RUBY_VERSION < '2.0.0'
end

group :development do
  gem "travis"
  gem "travis-lint"
  gem "puppet-blacksmith"
  gem 'rubocop'
end

group :system_tests do
  gem "beaker"
  gem "beaker-rspec"
  gem "beaker-puppet_install_helper"
end
