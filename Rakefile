require 'bundler'
require 'rake/testtask'

Bundler.setup(:default, :rake)

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*.rb']
end

task :default => [:test]