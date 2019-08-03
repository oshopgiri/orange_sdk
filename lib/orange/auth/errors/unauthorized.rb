class Orange::Auth::Errors::Unauthorized < Orange::Error
	def initialize(error:)
		super(error.message)
	end
end
