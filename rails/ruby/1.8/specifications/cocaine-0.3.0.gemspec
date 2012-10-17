# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cocaine}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Yurek"]
  s.date = %q{2012-08-29}
  s.description = %q{A small library for doing (command) lines}
  s.email = %q{jyurek@thoughtbot.com}
  s.files = [".gitignore", ".travis.yml", "GOALS", "Gemfile", "LICENSE", "NEWS.md", "README.md", "Rakefile", "cocaine.gemspec", "lib/cocaine.rb", "lib/cocaine/command_line.rb", "lib/cocaine/command_line/runners.rb", "lib/cocaine/command_line/runners/backticks_runner.rb", "lib/cocaine/command_line/runners/posix_runner.rb", "lib/cocaine/command_line/runners/process_runner.rb", "lib/cocaine/exceptions.rb", "lib/cocaine/version.rb", "spec/cocaine/command_line/runners/backticks_runner_spec.rb", "spec/cocaine/command_line/runners/posix_runner_spec.rb", "spec/cocaine/command_line/runners/process_runner_spec.rb", "spec/cocaine/command_line_spec.rb", "spec/spec_helper.rb", "spec/support/stub_os.rb", "spec/support/with_exitstatus.rb"]
  s.homepage = %q{http://www.thoughtbot.com/projects/cocaine}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A small library for doing (command) lines}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<posix-spawn>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<posix-spawn>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<posix-spawn>, [">= 0"])
  end
end
