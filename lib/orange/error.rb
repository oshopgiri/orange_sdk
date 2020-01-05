class Orange::Error < StandardError
	def initialize(message)
		super(message)
	end

	def message
		"#{@message}: #{@description}"
	end
end
