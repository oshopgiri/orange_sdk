module Orange
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path('../templates', __FILE__)

			desc 'Creates Orange SDK initializer for your application'

			def copy_initializer
				template 'orange_sdk_initializer.rb', 'config/initializers/orange_sdk.rb'
			end
		end
	end
end
