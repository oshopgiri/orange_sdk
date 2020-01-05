RSpec.describe Orange::SMS, vcr: true do
	it 'successfully generates a transaction URL' do
		order_id = '1'

		transaction_details = Orange::Money.initialize_transaction(
			order_id: order_id,
			amount: 2000,
			currency: 'OUV',
			return_url: "https://e-commerce-staging.herokuapp.com/orders/#{order_id}?payment_success=success",
			cancel_url: "https://e-commerce-staging.herokuapp.com/orders/#{order_id}?payment_success=cancel",
			notify_url: "https://e-commerce-staging.herokuapp.com/orders/#{order_id}",
			lang: 'en',
			merchant_name: 'Top Class'
		)

		expect(transaction_details).to be_a Orange::Money::TransactionDetail
		expect(transaction_details.payment_url).to eql "https://webpayment-ow-sb.orange-money.com/sx/mpayment/abstract/#{transaction_details.payment_token}"
	end
end
