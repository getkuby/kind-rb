$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'kind-rb/version'

Gem::Specification.new do |s|
  s.name     = 'kind-rb'
  s.version  = ::KindRb::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/getkuby/kind-rb'
  s.license  = 'Apache-2.0'

  s.summary = 'Kind (Kubernetes testing tool) distributed as a Rubygem.'
  s.description = 'The kind binary executable packaged and distributed as a Rubygem.'

  s.platform = Gem::Platform::RUBY

  s.require_path = 'lib'
  s.files = Dir['{lib,spec,vendor}/**/*', 'Gemfile', 'LICENSE', 'CHANGELOG.md', 'README.md', 'Rakefile', 'kind-rb.gemspec']
end
