module Orange
	module SMS
		autoload :Client, 'orange/sms/client'
		autoload :Error, 'orange/sms/error'

		def self.dispatch(sender_name: nil, sender_contact:, recipient_contact:, message:)
			Orange::SMS::Client.new(
				sender_name: sender_name,
				sender_contact: sender_contact,
				recipient_contact: recipient_contact,
				message: message
			).dispatch
		end
	end
end
