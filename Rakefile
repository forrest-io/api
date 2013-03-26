require 'rspec/core/rake_task'

desc 'Run RSpec specs'
RSpec::Core::RakeTask.new :spec

desc 'Run Turnip features'
RSpec::Core::RakeTask.new :acceptance do |t|
  t.pattern = 'spec/acceptance/**/*.feature'
end

task :default => [:spec, :acceptance]
