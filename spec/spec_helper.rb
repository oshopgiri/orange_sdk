require 'bundler/setup'
require 'byebug'
require 'dotenv'
require 'orange'
require 'vcr'

Dotenv.load

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = '.rspec_status'

	# Disable RSpec exposing methods globally on `Module` and `main`
	config.disable_monkey_patching!

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end

	config.around vcr: true do |example|
		name = example.full_description.downcase.gsub!(' ', '_')
		VCR.use_cassette(name) do
			example.run
		end
	end
end

require 'config/vcr'