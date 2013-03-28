require 'rspec/core/rake_task'

desc 'Run RSpec specs'
RSpec::Core::RakeTask.new :spec

desc 'Run Turnip features'
RSpec::Core::RakeTask.new :acceptance do |t|
  t.pattern = 'spec/acceptance/**/*.feature'
end

namespace :server do
  desc 'Start Unicorn'
  task :start do
    raise 'Server already started' if File.exists?('unicorn.pid')
    require 'foreman/cli'
    foreman = Foreman::CLI.new
    foreman.start
  end

  desc 'Stop Unicorn'
  task :stop do
    pid = File.read('unicorn.pid').strip.to_i
    Process.kill('INT', pid)
    puts 'Server stopped'
  end
end

desc 'Run the build on Travis CI'
task :travis => [:spec, :acceptance]

task :default => [:spec, :acceptance]
