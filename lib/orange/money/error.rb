class Orange::Money::Error < Orange::Error
	def initialize(response:)
		parsed_response = response.parsed_response

		@message = parsed_response['message']
		@description = parsed_response['description']

		super(message)
	end

	def message
		"#{@message}: #{@description}"
	end
end
