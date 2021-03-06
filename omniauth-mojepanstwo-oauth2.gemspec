# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-mojepanstwo-oauth2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Bin He, Krzysztof Madejski"
  gem.email         = "krzysztof.madejski@epf.org.pl"
  gem.description   = %q{OmniAuth Oauth2 strategy for mojepanstwo.pl.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for mojepanstwo.pl.}
  gem.homepage      = "https://github.com/kodujdlapolski/omniauth-mojepanstwo-oauth2"
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-mojepanstwo-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::MojepanstwoOauth2::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
