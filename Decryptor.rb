require('./Numberizer')

class Decryptor
	class << self
		def decrypt_string(string:, d:, n:)
			decrypted = string.split("-").map {|number| 
				Numberizer.get_letter_value(number: decrypt_value(encrypted: number.to_i, d: d, n: n))
			}
			decrypted.join()
		end

		def decrypt_value(encrypted:, d:, n:)
			(encrypted**d) % n
		end
	end
end