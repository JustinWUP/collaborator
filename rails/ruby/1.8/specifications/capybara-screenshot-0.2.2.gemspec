# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capybara-screenshot}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew O'Riordan"]
  s.date = %q{2012-08-06}
  s.description = %q{When a Cucumber step fails, it is useful to create a screenshot image and HTML file of the current page}
  s.email = ["matthew.oriordan@gmail.com"]
  s.files = [".gitignore", ".rspec", "CHANGELOG.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "capybara-screenshot.gemspec", "lib/capybara-screenshot.rb", "lib/capybara-screenshot/capybara.rb", "lib/capybara-screenshot/cucumber.rb", "lib/capybara-screenshot/minitest.rb", "lib/capybara-screenshot/rspec.rb", "lib/capybara-screenshot/saver.rb", "lib/capybara-screenshot/version.rb", "spec/capybara-screenshot/capybara_spec.rb", "spec/capybara-screenshot/saver_spec.rb", "spec/capybara-screenshot_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/mattheworiordan/capybara-screenshot}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{capybara-screenshot}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Automatically create snapshots when Cucumber steps fail with Capybara and Rails}
  s.test_files = ["spec/capybara-screenshot/capybara_spec.rb", "spec/capybara-screenshot/saver_spec.rb", "spec/capybara-screenshot_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>, [">= 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<capybara>, [">= 1.0"])
      s.add_dependency(%q<rspec>, ["~> 2.7"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<capybara>, [">= 1.0"])
    s.add_dependency(%q<rspec>, ["~> 2.7"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end
