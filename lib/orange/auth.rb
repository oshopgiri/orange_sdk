module Orange
	module Auth
		autoload :Client, 'orange/auth/client'
		autoload :Error, 'orange/auth/error'
		autoload :Token, 'orange/auth/token'

		def self.get_token
			Orange::Auth::Client.new.get_token
		end
	end
end
