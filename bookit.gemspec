require_relative 'lib/bookit/version'

Gem::Specification.new do |spec|
  spec.name          = "bookit"
  spec.version       = Bookit::VERSION
  spec.authors       = ["Cesar Del Pino"]
  spec.email         = ["cesar@delpino.com"]

  spec.summary       = %q{A simple table booking app.}
  spec.description   = %q{This is a booking app for a one table restaurant.}
  spec.homepage      = "https://github.com/CesDelPino/bookit"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/CesDelPino/bookit"
  spec.metadata["changelog_uri"] = "https://github.com/CesDelPino/bookit/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-prompt", "~> 0.22.0"
  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency 'ruby_figlet', '~> 0.6.1'
  spec.add_dependency 'rubocop', '~> 0.92.0'
end



