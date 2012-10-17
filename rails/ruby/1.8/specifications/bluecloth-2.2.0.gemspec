# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bluecloth}
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Granger"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDLDCCAhSgAwIBAgIBADANBgkqhkiG9w0BAQUFADA8MQwwCgYDVQQDDANnZWQx\nFzAVBgoJkiaJk/IsZAEZFgdfYWVyaWVfMRMwEQYKCZImiZPyLGQBGRYDb3JnMB4X\nDTEwMDkxNjE0NDg1MVoXDTExMDkxNjE0NDg1MVowPDEMMAoGA1UEAwwDZ2VkMRcw\nFQYKCZImiZPyLGQBGRYHX2FlcmllXzETMBEGCgmSJomT8ixkARkWA29yZzCCASIw\nDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALy//BFxC1f/cPSnwtJBWoFiFrir\nh7RicI+joq/ocVXQqI4TDWPyF/8tqkvt+rD99X9qs2YeR8CU/YiIpLWrQOYST70J\nvDn7Uvhb2muFVqq6+vobeTkILBEO6pionWDG8jSbo3qKm1RjKJDwg9p4wNKhPuu8\nKGue/BFb67KflqyApPmPeb3Vdd9clspzqeFqp7cUBMEpFS6LWxy4Gk+qvFFJBJLB\nBUHE/LZVJMVzfpC5Uq+QmY7B+FH/QqNndn3tOHgsPadLTNimuB1sCuL1a4z3Pepd\nTeLBEFmEao5Dk3K/Q8o8vlbIB/jBDTUx6Djbgxw77909x6gI9doU4LD5XMcCAwEA\nAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFJeoGkOr9l4B\n+saMkW/ZXT4UeSvVMA0GCSqGSIb3DQEBBQUAA4IBAQBG2KObvYI2eHyyBUJSJ3jN\nvEnU3d60znAXbrSd2qb3r1lY1EPDD3bcy0MggCfGdg3Xu54z21oqyIdk8uGtWBPL\nHIa9EgfFGSUEgvcIvaYqiN4jTUtidfEFw+Ltjs8AP9gWgSIYS6Gr38V0WGFFNzIH\naOD2wmu9oo/RffW4hS/8GuvfMzcw7CQ355wFR4KB/nyze+EsZ1Y5DerCAagMVuDQ\nU0BLmWDFzPGGWlPeQCrYHCr+AcJz+NRnaHCKLZdSKj/RHuTOt+gblRex8FAh8NeA\ncmlhXe46pZNJgWKbxZah85jIjx95hR8vOI+NAM5iH9kOqK13DrxacTKPhqj5PjwF\n-----END CERTIFICATE-----\n"]
  s.date = %q{2011-11-01}
  s.default_executable = %q{bluecloth}
  s.description = %q{BlueCloth is a Ruby implementation of John Gruber's
Markdown[http://daringfireball.net/projects/markdown/], a text-to-HTML
conversion tool for web writers. To quote from the project page: Markdown
allows you to write using an easy-to-read, easy-to-write plain text format,
then convert it to structurally valid XHTML (or HTML).

It borrows a naming convention and several helpings of interface from
{Redcloth}[http://redcloth.org/], Why the Lucky Stiff's processor for a
similar text-to-HTML conversion syntax called
Textile[http://www.textism.com/tools/textile/].

BlueCloth 2 is a complete rewrite using David Parsons'
Discount[http://www.pell.portland.or.us/~orc/Code/discount/] library, a C
implementation of Markdown. I rewrote it using the extension for speed and
accuracy; the original BlueCloth was a straight port from the Perl version
that I wrote in a few days for my own use just to avoid having to shell out to
Markdown.pl, and it was quite buggy and slow. I apologize to all the good
people that sent me patches for it that were never released.

Note that the new gem is called 'bluecloth' and the old one 'BlueCloth'. If
you have both installed, you can ensure you're loading the new one with the
'gem' directive:

	# Load the 2.0 version
	gem 'bluecloth', '>= 2.0.0'
	
	# Load the 1.0 version
	gem 'BlueCloth'
	require 'bluecloth'}
  s.email = ["ged@FaerieMUD.org"]
  s.executables = ["bluecloth"]
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["Manifest.txt", "README.rdoc", "History.rdoc"]
  s.files = [".gemtest", ".rspec", "History.rdoc", "LICENSE", "LICENSE.discount", "Manifest.txt", "README.rdoc", "Rakefile", "bin/bluecloth", "bluecloth.1.pod", "ext/Csio.c", "ext/VERSION", "ext/amalloc.h", "ext/bluecloth.c", "ext/bluecloth.h", "ext/config.h", "ext/css.c", "ext/cstring.h", "ext/docheader.c", "ext/emmatch.c", "ext/extconf.rb", "ext/generate.c", "ext/html5.c", "ext/markdown.c", "ext/markdown.h", "ext/mkdio.c", "ext/mkdio.h", "ext/resource.c", "ext/setup.c", "ext/tags.c", "ext/tags.h", "ext/version.c", "ext/xml.c", "ext/xmlpage.c", "lib/bluecloth.rb", "man/man1/bluecloth.1", "spec/bluecloth/101_changes_spec.rb", "spec/bluecloth/TEMPLATE", "spec/bluecloth/autolinks_spec.rb", "spec/bluecloth/blockquotes_spec.rb", "spec/bluecloth/code_spans_spec.rb", "spec/bluecloth/emphasis_spec.rb", "spec/bluecloth/entities_spec.rb", "spec/bluecloth/hrules_spec.rb", "spec/bluecloth/images_spec.rb", "spec/bluecloth/inline_html_spec.rb", "spec/bluecloth/links_spec.rb", "spec/bluecloth/lists_spec.rb", "spec/bluecloth/paragraphs_spec.rb", "spec/bluecloth/titles_spec.rb", "spec/bluecloth_spec.rb", "spec/bugfix_spec.rb", "spec/contributions_spec.rb", "spec/data/antsugar.txt", "spec/data/markdowntest/Amps and angle encoding.html", "spec/data/markdowntest/Amps and angle encoding.text", "spec/data/markdowntest/Auto links.html", "spec/data/markdowntest/Auto links.text", "spec/data/markdowntest/Backslash escapes.html", "spec/data/markdowntest/Backslash escapes.text", "spec/data/markdowntest/Blockquotes with code blocks.html", "spec/data/markdowntest/Blockquotes with code blocks.text", "spec/data/markdowntest/Code Blocks.html", "spec/data/markdowntest/Code Blocks.text", "spec/data/markdowntest/Code Spans.html", "spec/data/markdowntest/Code Spans.text", "spec/data/markdowntest/Hard-wrapped paragraphs with list-like lines.html", "spec/data/markdowntest/Hard-wrapped paragraphs with list-like lines.text", "spec/data/markdowntest/Horizontal rules.html", "spec/data/markdowntest/Horizontal rules.text", "spec/data/markdowntest/Inline HTML (Advanced).html", "spec/data/markdowntest/Inline HTML (Advanced).text", "spec/data/markdowntest/Inline HTML (Simple).html", "spec/data/markdowntest/Inline HTML (Simple).text", "spec/data/markdowntest/Inline HTML comments.html", "spec/data/markdowntest/Inline HTML comments.text", "spec/data/markdowntest/Links, inline style.html", "spec/data/markdowntest/Links, inline style.text", "spec/data/markdowntest/Links, reference style.html", "spec/data/markdowntest/Links, reference style.text", "spec/data/markdowntest/Links, shortcut references.html", "spec/data/markdowntest/Links, shortcut references.text", "spec/data/markdowntest/Literal quotes in titles.html", "spec/data/markdowntest/Literal quotes in titles.text", "spec/data/markdowntest/Markdown Documentation - Basics.html", "spec/data/markdowntest/Markdown Documentation - Basics.text", "spec/data/markdowntest/Markdown Documentation - Syntax.html", "spec/data/markdowntest/Markdown Documentation - Syntax.text", "spec/data/markdowntest/Nested blockquotes.html", "spec/data/markdowntest/Nested blockquotes.text", "spec/data/markdowntest/Ordered and unordered lists.html", "spec/data/markdowntest/Ordered and unordered lists.text", "spec/data/markdowntest/Strong and em together.html", "spec/data/markdowntest/Strong and em together.text", "spec/data/markdowntest/Tabs.html", "spec/data/markdowntest/Tabs.text", "spec/data/markdowntest/Tidyness.html", "spec/data/markdowntest/Tidyness.text", "spec/data/ml-announce.txt", "spec/data/re-overflow.txt", "spec/data/re-overflow2.txt", "spec/discount_spec.rb", "spec/lib/constants.rb", "spec/lib/helpers.rb", "spec/lib/matchers.rb", "spec/markdowntest_spec.rb"]
  s.homepage = %q{http://deveiate.org/projects/BlueCloth}
  s.licenses = ["BSD"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{bluecloth}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{BlueCloth is a Ruby implementation of John Gruber's Markdown[http://daringfireball.net/projects/markdown/], a text-to-HTML conversion tool for web writers}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
      s.add_development_dependency(%q<hoe-highline>, ["~> 0.0.1"])
      s.add_development_dependency(%q<tidy-ext>, ["~> 0.1"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<hoe>, ["~> 2.12"])
    else
      s.add_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
      s.add_dependency(%q<hoe-highline>, ["~> 0.0.1"])
      s.add_dependency(%q<tidy-ext>, ["~> 0.1"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<hoe>, ["~> 2.12"])
    end
  else
    s.add_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
    s.add_dependency(%q<hoe-highline>, ["~> 0.0.1"])
    s.add_dependency(%q<tidy-ext>, ["~> 0.1"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<hoe>, ["~> 2.12"])
  end
end
