require('./Decryptor')

class FileDecryptor
	def start
		encrypted_string = IO.read("files/test.txt.encrypted")
		puts encrypted_string
		private_key = IO.read("files/private_key.txt")
		puts private_key
		decrypted_string = Decryptor.decrypt_string(string: encrypted_string, private_key: private_key)
		puts decrypted_string
		IO.write("files/decrypted.txt", decrypted_string)
	end
end

f = FileDecryptor.new
f.start