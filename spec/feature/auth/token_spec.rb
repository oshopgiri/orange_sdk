RSpec.describe Orange::Auth, vcr: true do
	it 'successfully returns a token' do
		expect(Orange::Auth.token).to eql('em1bHropmR8gxyDF1NwJ910cU3uP')
	end
end
