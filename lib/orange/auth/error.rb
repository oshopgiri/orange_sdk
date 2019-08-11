class Orange::Auth::Error < Orange::Error
	def initialize(response:)
		parsed_response = response.parsed_response

		@type = parsed_response['error'].split('_').map { |type| type.capitalize }.join(' ')
		@description = parsed_response['error_description']

		super(message)
	end

	def message
		"#{@type}: #{@description}"
	end
end
