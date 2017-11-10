require('./TestCase.rb')
require('./Numberizer.rb')
require('./KeyGenerator.rb')
require('./Encryptor.rb')
require('./Decryptor.rb')
require('prime')

class Tests < TestCase
	def test_numberizer
		assert_equal(6, Numberizer.get_number_value(letter: 'b'))
		assert_equal('b', Numberizer.get_letter_value(number: 6))
	end

	def test_key_gen
		test_text = "d"
		k = KeyGenerator.new
		key_pair = k.generate_key_pair
		encrypted = Encryptor.encrypt_value(number: Numberizer.get_number_value(letter: test_text), e: key_pair[:e], n: key_pair[:n])
		decrypted = Decryptor.decrypt_value(encrypted: encrypted, d: key_pair[:d], n: key_pair[:n])
		assert_equal test_text, Numberizer.get_letter_value(number: decrypted)
	end

	def test_string_encryption
		test_string = "Hello I am an unencrypted string"
		k = KeyGenerator.new
		key_pair = k.generate_key_pair
		encrypted = Encryptor.encrypt_string(string: test_string, e: key_pair[:e], n: key_pair[:n])
		decrypted_string = Decryptor.decrypt_string(string: encrypted, d: key_pair[:d], n: key_pair[:n])

		assert_equal test_string, decrypted_string
		puts "Here is the public key: " + key_pair[:e].to_s
		puts "Here is the private key: " + key_pair[:d].to_s
		puts "Here is encrypted string: " + encrypted
		puts "Here is the decrypted string: " + decrypted_string
	end
end

t = Tests.new
t.run_tests