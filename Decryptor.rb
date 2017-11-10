require('./Numberizer')

class Decryptor
	class << self
		def decrypt_string(string:, private_key:)
			d = private_key.split("&")[0]
			n = private_key.split("&")[1]
			decrypted = string.split("-").map {|number| 
				Numberizer.get_letter_value(number: decrypt_value(encrypted: number.to_i, d: d.to_i, n: n.to_i))
			}
			decrypted.join()
		end

		def decrypt_value(encrypted:, d:, n:)
			(encrypted**d) % n
		end
	end
end