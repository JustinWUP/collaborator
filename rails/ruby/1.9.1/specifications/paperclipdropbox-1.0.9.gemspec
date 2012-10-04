# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "paperclipdropbox"
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Ketelle"]
  s.date = "2012-07-09"
  s.description = "Adds Dropbox storage support for the Paperclip gem. Dropbox account required."
  s.email = ["paul@ketelle.com"]
  s.homepage = "https://github.com/dripster82/paperclipdropbox"
  s.require_paths = ["lib"]
  s.rubyforge_project = "paperclipdropbox"
  s.rubygems_version = "1.8.15"
  s.summary = "Dropbox storage support for paperclip file attachment"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<dropbox>, [">= 0"])
    else
      s.add_dependency(%q<paperclip>, [">= 0"])
      s.add_dependency(%q<dropbox>, [">= 0"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 0"])
    s.add_dependency(%q<dropbox>, [">= 0"])
  end
end
