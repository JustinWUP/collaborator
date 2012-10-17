# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{columnize}
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["R. Bernstein"]
  s.date = %q{2011-12-16}
  s.description = %q{
In showing a long lists, sometimes one would prefer to see the value
arranged aligned in columns. Some examples include listing methods
of an object or debugger commands. 
See Examples in the rdoc documentation for examples.
}
  s.email = %q{rockyb@rubyforge.net}
  s.extra_rdoc_files = ["README.md", "lib/columnize.rb", "COPYING"]
  s.files = [".gitignore", "AUTHORS", "COPYING", "ChangeLog", "Makefile", "NEWS", "README.md", "Rakefile", "columnize.gemspec", "lib/Makefile", "lib/columnize.rb", "lib/columnize/Makefile", "lib/columnize/version.rb", "test/test-columnize.rb", "test/test-hashparm.rb", "test/test-issue3.rb"]
  s.homepage = %q{https://github.com/rocky/columnize}
  s.licenses = ["Ruby", "GPL2"]
  s.rdoc_options = ["--main", "README", "--title", "Columnize 0.3.6 Documentation"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = %q{columnize}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Module to format an Array as an Array of String aligned in columns}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
