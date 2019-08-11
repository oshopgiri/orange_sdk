class Orange::Money::Client
	include HTTParty

	base_uri "#{Orange::BASE_URI}/orange-money-webpay/dev/v1".freeze

	def initialize(order_id:, amount:, currency:, return_url:, cancel_url:, notify_url:, lang:, merchant_name:)
		@path = '/webpayment'
		@order_id = order_id
		@amount = amount.to_f
		@currency = currency
		@return_url = return_url
		@cancel_url = cancel_url
		@notify_url = notify_url
		@lang = lang
		@merchant_name = merchant_name
	end

	def initialize_transaction
		response = self.class.post(@path, headers: headers, body: {
			merchant_key: Orange.configuration.merchant_key,
			order_id: @order_id,
			amount: @amount,
			currency: @currency,
			return_url: @return_url,
			cancel_url: @cancel_url,
			notif_url: @notify_url,
			lang: @lang,
			reference: @merchant_name
		}.to_json)

		if response.success?
			Orange::Money::TransactionDetail.new(response: response)
		else
			raise Orange::Money::Error.new(response: response)
		end
	end

	private

		def headers
			{
				Authorization: "Bearer #{Orange::Auth.get_token.access_token}",
				'Content-Type': 'application/json',
				Accept: 'application/json'
			}
		end
end
