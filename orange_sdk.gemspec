lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orange/version'

Gem::Specification.new do |spec|
	spec.name = 'orange_sdk'
	spec.version = Orange::VERSION
	spec.authors = ['Osho Giri']
	spec.email = ['oshopgiri@hotmail.com']

	spec.summary = %q{Consume APIs for Orange Products with ease.}
	spec.description = %q{Ruby implementation of APIs for Orange Products}
	spec.homepage = 'https://github.com/oshopgiri/orange_sdk'
	spec.license = 'MIT'

	# Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
	# to allow pushing to a single host or delete this section to allow pushing to any host.
	if spec.respond_to?(:metadata)
		spec.metadata['allowed_push_host'] = ''

		spec.metadata['homepage_uri'] = spec.homepage
		spec.metadata['source_code_uri'] = spec.homepage
		spec.metadata['changelog_uri'] = spec.homepage
	else
		raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
	end

	# Specify which files should be added to the gem when it is released.
	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
	spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
		`git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	end
	spec.bindir = 'exe'
	spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']

	spec.add_development_dependency 'bundler', '~> 1.16'
	spec.add_development_dependency 'byebug', '~> 11.0'
	spec.add_development_dependency 'dotenv', '~> 2.7'
	spec.add_development_dependency 'rake', '~> 13.0'
	spec.add_development_dependency 'rspec', '~> 3.0'
	spec.add_development_dependency 'vcr', '~> 5.0'
	spec.add_development_dependency 'webmock', '~> 3.6'

	spec.add_dependency 'httparty', '~> 0.17.0'
end
