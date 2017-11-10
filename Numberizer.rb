class Numberizer
	class << self
		@@letters = ['a', 'b', 'c', 'd', 'e']
		def get_number_value(letter:)
			@@letters.index(letter)
		end

		def get_letter_value(number:)
			@@letters[number]
		end
	end
end