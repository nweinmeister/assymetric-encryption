class Numberizer
	class << self
		@@letters = ('a'...'z').to_a + ('A'...'Z').to_a + [' ']
		def get_number_value(letter:)
			@@letters.index(letter) + 5
		end

		def get_letter_value(number:)
			@@letters[number - 5]
		end
	end
end