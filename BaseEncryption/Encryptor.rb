require('./Tools/Numberizer.rb')

class Encryptor
	class << self
		def encrypt_string(string:, public_key:)
			e = public_key.split("&")[0]
			n = public_key.split("&")[1]
			encrypted = string.split("").each_with_object([]) {|letter, encrypted_array| 
				encrypted_array.push(encrypt_value(number: Numberizer.get_number_value(letter: letter), e: e.to_i, n: n.to_i))
			}
			encrypted.join("-")
		end

		def encrypt_value(number:, e:, n:)
			(number**e) % n
		end
	end
end