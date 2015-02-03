require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:all) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
  task.rspec_opts = '--format documentation'
end

desc "Run all but the integration specs"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.exclude_pattern = "spec/integration/**/ai_integration_spec.rb"
  task.rspec_opts = '--format documentation'
end

task :default => :spec









