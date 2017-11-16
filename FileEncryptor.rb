require('./KeyGenerator.rb')
require('./Encryptor.rb')

class FileEncryptor
	def start	
		string = IO.read("files/test.txt")
		public_key = IO.read("files/public_key.txt")
		encrypted_string = Encryptor.encrypt_string(string: string, public_key: public_key)
		IO.write("files/test.txt.encrypted", encrypted_string)
	end
end

f = FileEncryptor.new
f.start