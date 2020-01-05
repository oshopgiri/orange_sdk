RSpec.describe Orange::SMS, vcr: true do
	it 'successfully sends an SMS' do
		expect {
			Orange::SMS.dispatch(
				sender_contact: '+22737373737',
				recipient_contact: '+22373737373',
				message: 'Test SMS'
			)
		}.to_not raise_error
	end
end
