# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libwebsocket}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bernard Potocki"]
  s.date = %q{2012-03-20 00:00:00.000000000Z}
  s.description = %q{Universal Ruby library to handle WebSocket protocol}
  s.email = %q{bernard.potocki@imanel.org}
  s.extra_rdoc_files = ["README.md"]
  s.files = ["CHANGELOG.md", "README.md", "Rakefile", "examples/eventmachine_server.rb", "examples/plain_client.rb", "examples/thin_server.rb", "lib/libwebsocket.rb", "lib/libwebsocket/cookie.rb", "lib/libwebsocket/cookie/request.rb", "lib/libwebsocket/cookie/response.rb", "lib/libwebsocket/frame.rb", "lib/libwebsocket/message.rb", "lib/libwebsocket/opening_handshake.rb", "lib/libwebsocket/opening_handshake/client.rb", "lib/libwebsocket/opening_handshake/server.rb", "lib/libwebsocket/request.rb", "lib/libwebsocket/response.rb", "lib/libwebsocket/stateful.rb", "lib/libwebsocket/url.rb", "libwebsocket.gemspec", "test/libwebsocket/cookie/request.rb", "test/libwebsocket/cookie/response.rb", "test/libwebsocket/opening_handshake/test_client.rb", "test/libwebsocket/opening_handshake/test_server.rb", "test/libwebsocket/test_cookie.rb", "test/libwebsocket/test_frame.rb", "test/libwebsocket/test_message.rb", "test/libwebsocket/test_request_75.rb", "test/libwebsocket/test_request_76.rb", "test/libwebsocket/test_request_common.rb", "test/libwebsocket/test_response_75.rb", "test/libwebsocket/test_response_76.rb", "test/libwebsocket/test_response_common.rb", "test/libwebsocket/test_url.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/imanel/libwebsocket}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Universal Ruby library to handle WebSocket protocol}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 0"])
    else
      s.add_dependency(%q<addressable>, [">= 0"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 0"])
  end
end
