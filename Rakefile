require 'rake/testtask'
require 'minitest/autorun'
require 'simplecov'

Rake::TestTask.new(:test) do |test|
  SimpleCov.minimum_coverage 80
  #SimpleCov.command_name 'test:units'
  SimpleCov.start do
    add_filter '/test/'
  end
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  #test.test_files = FileList['test/**/test_*.rb']
end

# Rakefile
#task :default => [:test]