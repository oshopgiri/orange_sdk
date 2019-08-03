class Orange::Auth::Errors::BadRequest < Orange::Error
	def initialize(error:)
		super(error.message)
	end
end
