class Orange::Money::TransactionDetail
	attr_accessor :payment_token, :payment_url, :notify_token

	def initialize(response:)
		parsed_response = response.parsed_response

		@payment_token = parsed_response['pay_token']
		@payment_url = parsed_response['payment_url']
		@notify_token = parsed_response['notif_token']
	end
end
