require 'rake'
require 'rake/testtask'
require 'simplecov'

Rake::TestTask.new(:test) do |test|
  SimpleCov.start do
    add_filter 'test'
    minimum_coverage 80
  end
  SimpleCov.at_exit do
    SimpleCov.result.format!
  end
  #test.pattern = 'test/*_test.rb'
  test.pattern = 'test/**/*_test.rb'
end

require 'bundler/gem_tasks'
require 'minitest/autorun'
require 'minitest/unit'

#Callsed from 'rake'
task :default do
  puts 'Default task'
end

#Callsed from 'rake test'
#task :test do
#  SimpleCov.minimum_coverage 80
#  SimpleCov.start
#  puts "Hello World test!"
#end

#Fire tests from 'rake'
task :default => [:test]