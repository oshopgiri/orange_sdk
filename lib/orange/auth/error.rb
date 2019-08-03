class Orange::Auth::Error
	attr_accessor :code, :type, :description

	def initialize(response:)
		@code = response.code

		parsed_response = response.parsed_response
		@type = parsed_response['error'].split('_').map { |type| type.capitalize }.join(' ')
		@description = parsed_response['error_description']
	end

	def message
		"#{@type}: #{@description}"
	end
end