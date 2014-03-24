Gem::Specification.new do |s|
  s.name = 'radix_tree'
  s.version = '0.0.1'
  s.default_executable = 'radix_tree'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['Aleksey Sharlaimov']
  s.date = %q{2014-03-03}
  s.description = %q{A Radix Tree gem}
  s.email = %q{nick@quaran.to}
  s.files = ["Rakefile", "bin/main.rb", "lib/radix_tree.rb", "test/test_radix_tree.rb"]
  s.test_files = ["test/test_radix_tree.rb"]
  s.homepage = %q{http://rubygems.org/gems/hola}
  s.license = 'MIT'
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{RadixTree!}

  s.bindir = 'bin'

  s.add_runtime_dependency "minitest"
  s.add_runtime_dependency "simplecov"

  if s.respond_to? :specification_version
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

#gem build radix_tree.gemspec
#http://www.sitepoint.com/creating-your-first-gem/
