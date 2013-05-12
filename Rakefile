require 'rspec/core/rake_task'

task :default => [:spec, :acceptance]

desc 'Run the build on Travis CI'
task :travis => [:spec, :acceptance]

desc 'Run RSpec specs'
RSpec::Core::RakeTask.new :spec

desc 'Run Turnip features'
RSpec::Core::RakeTask.new :acceptance do |t|
  t.pattern = 'spec/acceptance/**/*.feature'
end

namespace :server do
  desc 'Start Unicorn'
  task :start do
    raise 'Server already started' if server_up?
    require 'foreman/cli'
    foreman = Foreman::CLI.new
    foreman.start
  end

  desc 'Stop Unicorn'
  task :stop do
    raise 'Server already stopped' unless server_up?
    Process.kill('INT', pid)
    puts 'Server stopped'
  end
end

private

def server_up?
  return false unless pidfile_exists?
  Process.getpgid(pid) rescue return false
  true
end

def pidfile_exists?
  File.exists?('unicorn.pid')
end

def pid
  File.read('unicorn.pid').strip.to_i
end