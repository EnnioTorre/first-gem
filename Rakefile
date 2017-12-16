require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/testtask"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Rake::TestTask.new do |t|
  t.test_files = FileList['lib/first/rugged*.rb']
  t.verbose = true
end
