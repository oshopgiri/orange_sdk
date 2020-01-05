class Orange::SMS::Error < Orange::Error
	def initialize(response:)
		parsed_response = if response.parsed_response['requestError'].key?('serviceException')
			                  response.parsed_response['requestError']['serviceException']
			              else
				              response.parsed_response['requestError']['policyException']
		                  end

		@type = parsed_response['messageId']
		@description = parsed_response['text'].split('.').first

		super(message)
	end
end
