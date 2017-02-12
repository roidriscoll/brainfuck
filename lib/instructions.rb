require 'pointer'

class Instructions

	attr_reader :sequence, :pointer

	def initialize(instructions)
		@sequence = sanitize(instructions)
		@pointer = Pointer.new
	end

	private

	def sanitize(instructions)
		raise "Invalid syntax" unless instructions.is_a?(String)
		validate(instructions)
	end

	def validate(instructions)
		sequence = instructions.split(//)
		sequence.each do |command|
			raise "Invalid command" unless Brainfuck::METHOD_LOOKUP.has_key?(command)
		end
	end
end
