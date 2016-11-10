# frozen_string_literal: true
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new { |t| t.pattern = 'spec/**/*_spec.rb' }

task default: %w(rubocop spec)
