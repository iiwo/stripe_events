$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'stripe_manager/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'stripe_manager'
  s.version     = StripeManager::VERSION
  s.authors     = ['Iwo Dziechciarow']
  s.email       = ['iiwo@o2.pl']
  s.homepage    = 'https://www.arcadiapower.com'
  s.summary     = 'simple event pulling for Stripe'
  s.description = 'simple event pulling for Stripe'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.3'
  s.add_dependency 'pg'
  s.add_dependency 'stripe'
  s.add_development_dependency 'sqlite3'
end
