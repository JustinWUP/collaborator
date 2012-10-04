# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dropbox"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Morgan"]
  s.date = "2011-07-19"
  s.description = "An easy-to-use client library for the official Dropbox API."
  s.email = "dropbox@timothymorgan.info"
  s.extra_rdoc_files = ["ChangeLog", "LICENSE", "README.rdoc"]
  s.files = ["ChangeLog", "LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/RISCfuture/dropbox"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Ruby client library for the official Dropbox API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
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
