require 'bundler'
require 'rake/testtask'

Bundler.setup(:default, :rake)

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*.rb']
end

task :default => [:test]

task :console do
  ruby "bin/server.rb db/dictionary.txt"
  ruby "bin/client.rb db/dictionary.txt"
end