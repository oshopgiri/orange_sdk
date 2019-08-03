module Orange
	module Auth
		module Errors
			autoload :BadRequest, 'orange/auth/errors/bad_request'
			autoload :Forbidden, 'orange/auth/errors/forbidden'
			autoload :Unauthorized, 'orange/auth/errors/unauthorized'

			def self.handle(error:)
				case (error.code)
					when 400
						raise Orange::Auth::Errors::BadRequest.new(error: error)
					when 401
						raise Orange::Auth::Errors::Unauthorized.new(error: error)
					when 403
						raise Orange::Auth::Errors::Forbidden.new(error: error)
				end
			end
		end
	end
end
