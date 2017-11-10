require('./Numberizer.rb')

class Encryptor
	class << self
		def encrypt_string(string:, e:, n:)
			encrypted = string.split("").each_with_object([]) {|letter, encrypted_array| 
				encrypted_array.push(encrypt_value(number: Numberizer.get_number_value(letter: letter), e: e, n: n))
			}
			encrypted.join("-")
		end

		def encrypt_value(number:, e:, n:)
			(number**e) % n
		end
	end
end