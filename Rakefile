require "bundler/gem_tasks"
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/PoliceDataClient'
  t.test_files = FileList['test/lib/PoliceDataClient/test_*.rb']
  t.verbose = true
end
 
task :default => :test