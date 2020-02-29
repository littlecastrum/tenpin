lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tenpin/version"

Gem::Specification.new do |spec|
  spec.name          = "tenpin"
  spec.version       = Tenpin::VERSION
  spec.authors       = ["Dan Castrillo"]
  spec.email         = ["littlecastrum@gmail.com"]

  spec.summary       = %q{A Ten Pin Game score file parser}
  spec.description   = %q{A Ten Pin Game score file parser that outputs a scoreboard}
  spec.homepage      = "https://github.com/littlecastrum/tenpin"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/littlecastrum/tenpin"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "terminal-table", "~> 1.8"
  spec.add_dependency "colorize", "~> 0.8.1"
end
