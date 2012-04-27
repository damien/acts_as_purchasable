# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_purchasable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Damien Wilson"]
  gem.email         = ["damien@mindglob.com"]
  gem.description   = %q{Everything has it's price, and now your ActiveRecord models can too!}
  gem.summary       = %q{`acts_as_purchasable` extends ActiveRecord models with methods that allow you to perform simple payment transactions on your models.}
  gem.homepage      = "https://github.com/damien/acts_as_purchasable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "acts_as_purchasable"
  gem.require_paths = ["lib"]
  gem.version       = ActsAsPurchasable::VERSION

  gem.add_dependency "rails", "~> 3.2"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "growl"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
end
