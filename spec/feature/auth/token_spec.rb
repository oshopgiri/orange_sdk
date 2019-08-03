RSpec.describe Orange::Auth, vcr: true do
	it 'successfully returns a token' do
		token = Orange::Auth.get_token

		expect(token).to be_a Orange::Auth::Token
		expect(token.access_token).to eql 'em1bHropmR8gxyDF1NwJ910cU3uP'
	end
end
