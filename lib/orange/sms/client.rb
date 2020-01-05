class Orange::SMS::Client
	include HTTParty

	base_uri "#{Orange::BASE_URI}/smsmessaging/v1/outbound".freeze

	def initialize(sender_name: nil, sender_contact:, recipient_contact:, message:)
		@path = '/requests'
		@sender_name = sender_name
		@sender_contact = format_contact_number(sender_contact)
		@recipient_contact = format_contact_number(recipient_contact)
		@message = message
	end

	def dispatch
		response = self.class.post(
			"/tel:#{@sender_contact}#{@path}",
			headers: {
				Authorization: "Bearer #{Orange::Auth.get_token.access_token}",
				'Content-Type': 'application/json',
				Accept: 'application/json'
			},
			body: {
				outboundSMSMessageRequest: {
					address: "tel:#{@recipient_contact}",
					outboundSMSTextMessage: {
						message: @message
					},
					senderAddress: "tel:#{@sender_contact}",
					senderName: @sender_name || @sender_contact
				}
			}.to_json
		)

		if response.success?
			response.success?
		else
			raise Orange::SMS::Error.new(response: response)
		end
	end

	private

		def format_contact_number contact_number
			contact_number.gsub!(' ', '')
			contact_number
		end
end
