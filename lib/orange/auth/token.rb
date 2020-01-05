class Orange::Auth::Token
	attr_accessor :type, :access_token, :expires_in

	def initialize(response:)
		parsed_response = response.parsed_response

		@type = parsed_response['token_type']
		@access_token = parsed_response['access_token']
		@expires_in = parsed_response['expires_in'].to_i
	end
end
