
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "first/gem/version"

Gem::Specification.new do |spec|
  spec.name          = "first-gem"
  spec.version       = First::Gem::VERSION
  spec.authors       = ["me: Write your name"]
  spec.email         = ["me: Write your email address"]

  spec.summary       = %q{me: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{me: Write a longer description or delete this line.}
  spec.homepage      = "me: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "me: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"

  spec.add_dependency "rugged"
  spec.add_dependency "octokit", "~> 4.0"
  spec.add_dependency "travis"
  spec.add_dependency "puppet", "~> 4.2.2"
end
