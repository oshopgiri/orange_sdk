require 'httparty'

class Orange::SMS
	include HTTParty

	base_uri "#{Orange::BASE_URI}/smsmessaging/v1/outbound".freeze

	def self.dispatch(path: '/requests', sender_name: nil, sender_contact: , recipient_contact:, message:)
		return if sender_contact.nil? || recipient_contact.nil? || message.nil?

		access_token = Orange::Auth.token
		(recipient_contact = recipient_contact.dup).gsub!(' ', '')
		(sender_contact = sender_contact.dup).gsub!(' ', '')

		unless access_token.nil?
			headers = {
				Authorization: "Bearer #{access_token}",
				'Content-Type': 'application/json',
				Accept: 'application/json'
			}

			body = {
				outboundSMSMessageRequest: {
					address: "tel:#{recipient_contact}",
					outboundSMSTextMessage: {
						message: message
					},
					senderAddress: "tel:#{sender_contact}",
					senderName: sender_name || sender_contact
				}
			}.to_json

			response = self.post("/tel:#{sender_contact}#{path}", headers: headers, body: body)

			response.response.error! unless response.success?
		end
	end
end
