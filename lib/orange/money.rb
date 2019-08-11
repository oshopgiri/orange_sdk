module Orange
	module Money
		autoload :Client, 'orange/money/client'
		autoload :Error, 'orange/money/error'
		autoload :TransactionDetail, 'orange/money/transaction_detail'

		def self.initialize_transaction(
			order_id:, amount:, currency:, return_url:, cancel_url:, notify_url:, lang:, merchant_name:
		)
			Orange::Money::Client.new(
				order_id: order_id,
				amount: amount,
				currency: currency,
				return_url: return_url,
				cancel_url: cancel_url,
				notify_url: notify_url,
				lang: lang,
				merchant_name: merchant_name
			).initialize_transaction
		end
	end
end
