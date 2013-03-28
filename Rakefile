require 'rspec/core/rake_task'

desc 'Run RSpec specs'
RSpec::Core::RakeTask.new :spec

desc 'Run Turnip features'
RSpec::Core::RakeTask.new :acceptance do |t|
  t.pattern = 'spec/acceptance/**/*.feature'
end

desc 'Run the build on Travis CI'
task :travis => [:spec]

task :default => [:spec, :acceptance]

