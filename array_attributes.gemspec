# frozen_string_literal: true

$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), 'lib'))

require 'array_attributes/version'

Gem::Specification.new do |s|
  s.name = 'array_attributes'
  s.version = ArrayAttributes::VERSION
  s.required_ruby_version = '>= 2.4.0'
  s.summary = 'ArrayAttributes - Rails Concern to encapsulate common array attributes methods'
  s.description = s.summary
  s.author = 'GoGrow'
  s.email = 'hello@gogrow.dev'
  s.homepage = 'https://github.com/gogrow-dev/array_attributes'
  s.license = 'MIT'
  s.metadata['rubygems_mfa_required'] = 'true'
  s.files = Dir['{app,lib}/**/*', 'LICENSE', 'README.md']
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'activerecord', '>= 5.2', '< 7.1'

  s.add_development_dependency 'rubocop', '~> 0'
end
