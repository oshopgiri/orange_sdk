class Orange::Auth::Errors::Forbidden < Orange::Error
	def initialize(error:)
		super(error.message)
	end
end
