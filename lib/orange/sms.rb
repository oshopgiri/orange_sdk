require 'httparty'

class Orange::SMS
	include HTTParty

	base_uri "#{Orange::BASE_URI}/smsmessaging/v1/outbound".freeze

	class << self
		def dispatch(sender_name: nil, sender_contact:, recipient_contact:, message:)
			self.new(
				sender_name: sender_name,
				sender_contact: sender_contact,
				recipient_contact: recipient_contact,
				message: message
			).dispatch
		end
	end

	def initialize(path: '/requests', sender_name: nil, sender_contact:, recipient_contact:, message:)
		@path = path
		@sender_name = sender_name
		@sender_contact = format_contact_number(sender_contact)
		@recipient_contact = format_contact_number(recipient_contact)
		@message = message
	end

	def dispatch
		body = {
			outboundSMSMessageRequest: {
				address: "tel:#{@recipient_contact}",
				outboundSMSTextMessage: {
					message: @message
				},
				senderAddress: "tel:#{@sender_contact}",
				senderName: @sender_name || @sender_contact
			}
		}.to_json

		response = self.class.post("/tel:#{@sender_contact}#{@path}", headers: headers, body: body)

		response.response.error! unless response.success?
	end

	private

		def headers
			access_token = Orange::Auth.token

			{
				Authorization: "Bearer #{access_token}",
				'Content-Type': 'application/json',
				Accept: 'application/json'
			}
		end

		def format_contact_number contact_number
			contact_number.gsub!(' ', '')
			contact_number
		end
end
