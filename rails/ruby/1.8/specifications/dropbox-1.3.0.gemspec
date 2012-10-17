# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dropbox}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Morgan"]
  s.date = %q{2011-07-19}
  s.description = %q{An easy-to-use client library for the official Dropbox API.}
  s.email = %q{dropbox@timothymorgan.info}
  s.extra_rdoc_files = ["ChangeLog", "LICENSE", "README.rdoc"]
  s.files = [".document", ".rspec", "ChangeLog", "Gemfile", "Gemfile.lock", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "dropbox.gemspec", "examples/upload_and_delete.rb", "keys.json.example", "lib/dropbox.rb", "lib/dropbox/api.rb", "lib/dropbox/entry.rb", "lib/dropbox/event.rb", "lib/dropbox/extensions/array.rb", "lib/dropbox/extensions/hash.rb", "lib/dropbox/extensions/module.rb", "lib/dropbox/extensions/object.rb", "lib/dropbox/extensions/string.rb", "lib/dropbox/extensions/to_bool.rb", "lib/dropbox/memoization.rb", "lib/dropbox/revision.rb", "lib/dropbox/session.rb", "spec/dropbox/api_spec.rb", "spec/dropbox/entry_spec.rb", "spec/dropbox/event_spec.rb", "spec/dropbox/revision_spec.rb", "spec/dropbox/session_spec.rb", "spec/dropbox_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/RISCfuture/dropbox}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Ruby client library for the official Dropbox API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.3.6"])
      s.add_runtime_dependency(%q<json>, [">= 1.2.0"])
      s.add_runtime_dependency(%q<multipart-post>, [">= 1.1.0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0"])
      s.add_development_dependency(%q<mechanize>, [">= 0"])
    else
      s.add_dependency(%q<oauth>, [">= 0.3.6"])
      s.add_dependency(%q<json>, [">= 1.2.0"])
      s.add_dependency(%q<multipart-post>, [">= 1.1.0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.0"])
      s.add_dependency(%q<mechanize>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.3.6"])
    s.add_dependency(%q<json>, [">= 1.2.0"])
    s.add_dependency(%q<multipart-post>, [">= 1.1.0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.0"])
    s.add_dependency(%q<mechanize>, [">= 0"])
  end
end
