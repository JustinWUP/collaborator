# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capybara-webkit}
  s.version = "0.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["thoughtbot", "Joe Ferris", "Matt Mongeau", "Mike Burns", "Jason Morrison"]
  s.date = %q{2012-05-30 00:00:00.000000000Z}
  s.email = %q{support@thoughtbot.com}
  s.extensions = ["extconf.rb"]
  s.files = [".gitignore", ".rspec", "Appraisals", "CONTRIBUTING.md", "ChangeLog", "Gemfile", "Gemfile.lock", "LICENSE", "NEWS.md", "README.md", "Rakefile", "bin/Info.plist", "capybara-webkit.gemspec", "extconf.rb", "gemfiles/1.0.gemfile", "gemfiles/1.0.gemfile.lock", "gemfiles/1.1.gemfile", "gemfiles/1.1.gemfile.lock", "lib/capybara-webkit.rb", "lib/capybara/driver/webkit.rb", "lib/capybara/driver/webkit/browser.rb", "lib/capybara/driver/webkit/connection.rb", "lib/capybara/driver/webkit/cookie_jar.rb", "lib/capybara/driver/webkit/node.rb", "lib/capybara/driver/webkit/socket_debugger.rb", "lib/capybara/driver/webkit/version.rb", "lib/capybara/webkit.rb", "lib/capybara/webkit/matchers.rb", "lib/capybara_webkit_builder.rb", "spec/browser_spec.rb", "spec/capybara_webkit_builder_spec.rb", "spec/connection_spec.rb", "spec/cookie_jar_spec.rb", "spec/driver_rendering_spec.rb", "spec/driver_resize_window_spec.rb", "spec/driver_spec.rb", "spec/integration/driver_spec.rb", "spec/integration/session_spec.rb", "spec/self_signed_ssl_cert.rb", "spec/spec_helper.rb", "src/Body.h", "src/ClearCookies.cpp", "src/ClearCookies.h", "src/Command.cpp", "src/Command.h", "src/CommandFactory.cpp", "src/CommandFactory.h", "src/CommandParser.cpp", "src/CommandParser.h", "src/Connection.cpp", "src/Connection.h", "src/ConsoleMessages.cpp", "src/ConsoleMessages.h", "src/CurrentUrl.cpp", "src/CurrentUrl.h", "src/Evaluate.cpp", "src/Evaluate.h", "src/Execute.cpp", "src/Execute.h", "src/Find.cpp", "src/Find.h", "src/FrameFocus.cpp", "src/FrameFocus.h", "src/GetCookies.cpp", "src/GetCookies.h", "src/Header.cpp", "src/Header.h", "src/Headers.cpp", "src/Headers.h", "src/IgnoreSslErrors.cpp", "src/IgnoreSslErrors.h", "src/JavascriptInvocation.cpp", "src/JavascriptInvocation.h", "src/NetworkAccessManager.cpp", "src/NetworkAccessManager.h", "src/NetworkCookieJar.cpp", "src/NetworkCookieJar.h", "src/Node.cpp", "src/Node.h", "src/NullCommand.cpp", "src/NullCommand.h", "src/PageLoadingCommand.cpp", "src/PageLoadingCommand.h", "src/Render.cpp", "src/Render.h", "src/RequestedUrl.cpp", "src/RequestedUrl.h", "src/Reset.cpp", "src/Reset.h", "src/ResizeWindow.cpp", "src/ResizeWindow.h", "src/Response.cpp", "src/Response.h", "src/Server.cpp", "src/Server.h", "src/SetCookie.cpp", "src/SetCookie.h", "src/SetProxy.cpp", "src/SetProxy.h", "src/Source.cpp", "src/Source.h", "src/Status.cpp", "src/Status.h", "src/UnsupportedContentHandler.cpp", "src/UnsupportedContentHandler.h", "src/Url.cpp", "src/Url.h", "src/Visit.cpp", "src/Visit.h", "src/WebPage.cpp", "src/WebPage.h", "src/body.cpp", "src/capybara.js", "src/find_command.h", "src/main.cpp", "src/webkit_server.pro", "src/webkit_server.qrc", "templates/Command.cpp", "templates/Command.h", "webkit_server.pro"]
  s.homepage = %q{http://github.com/thoughtbot/capybara-webkit}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Headless Webkit driver for Capybara}
  s.test_files = ["spec/browser_spec.rb", "spec/capybara_webkit_builder_spec.rb", "spec/connection_spec.rb", "spec/cookie_jar_spec.rb", "spec/driver_rendering_spec.rb", "spec/driver_resize_window_spec.rb", "spec/driver_spec.rb", "spec/integration/driver_spec.rb", "spec/integration/session_spec.rb", "spec/self_signed_ssl_cert.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>, [">= 1.0.0", "< 1.2"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<mini_magick>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.4.0"])
    else
      s.add_dependency(%q<capybara>, [">= 1.0.0", "< 1.2"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
    end
  else
    s.add_dependency(%q<capybara>, [">= 1.0.0", "< 1.2"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
  end
end
