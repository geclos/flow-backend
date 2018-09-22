$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "public/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "public"
  s.version     = Public::VERSION
  s.authors     = ["Gerard Clos"]
  s.email       = ["clos.gerard@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.7"

  s.add_development_dependency "sqlite3"
end
