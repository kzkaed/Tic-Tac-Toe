# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic-tac-toe/version'

Gem::Specification.new do |spec|
  spec.name          = "tic-tac-toe"
  spec.version       = TicTacToe::VERSION
  spec.authors       = ["kristinkaeding"]
  spec.email         = ["kkaeding@8thlight.com"]
  spec.summary       = %q{Tic Tac Toe Console Game.}
  spec.description   = %q{Tic Tac Toe Console Game.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end