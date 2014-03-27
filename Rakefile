require 'bundler'
require 'rake/testtask'

Bundler.setup(:default, :rake)

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*.rb']
end

task :default => [:test]

task :console do
  ruby "bin/sinatra.rb" #ruby -rubygems bin/sinatra.rb
  #ruby "bin/server.rb" #ruby -rubygems bin/server.rb
  #ruby "bin/client.rb" #ruby -rubygems bin/client.rb
end