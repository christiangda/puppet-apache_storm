require 'rubygems'
require 'rspec/core/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet_blacksmith/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'
require 'rubocop/rake_task'

exclude_paths = [
  'pkg/**/*',
  'vendor/**/*',
  '.vendor/**/*',
  'spec/**/*'
]

log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'

PuppetLint::RakeTask.new :lint do |config|
  config.disable_checks = ['disable_80chars']
  config.fail_on_warnings = true
  config.with_context = true
  config.ignore_paths = exclude_paths
  config.log_format = log_format
end

Blacksmith::RakeTask.new do |t|
  t.tag_pattern = "v%s" # Use a custom pattern with git tag. %s is replaced with the version number.
  t.build = false # do not build the module nor push it to the Forge, just do the tagging [:clean, :tag, :bump_commit]
end

RSpec::Core::RakeTask.new(:spec_verbose) do |t|
  t.pattern = 'spec/{classes,defines,lib,reports}/**/*_spec.rb'
  t.rspec_opts = [
    '--format documentation',
    '--require "ci/reporter/rspec"',
    '--format CI::Reporter::RSpecFormatter',
    '--color'
  ]
end

RuboCop::RakeTask.new

# desc "Validate manifests, templates, and ruby files"
# task :validate do
#   Dir['manifests/**/*.pp'].each do |manifest|
#     sh "puppet parser validate --noop #{manifest}"
#   end
#   Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
#     sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
#   end
#   Dir['templates/**/*.erb'].each do |template|
#     sh "erb -P -x -T '-' #{template} | ruby -c"
#   end
# end

task :test => [
  :metadata_lint,
  :syntax,
  :lint,
  :rubocop,
  :validate,
  :spec
]

# task :default => :test
