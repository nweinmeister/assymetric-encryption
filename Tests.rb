require('./TestCase.rb')
require('./Numberizer.rb')
require('./KeyGenerator.rb')
require('prime')

class Tests < TestCase
	def test_numberizer
		assert_equal(1, Numberizer.get_number_value(letter: 'b'))
		assert_equal('b', Numberizer.get_letter_value(number: 1))
	end

	def test_key_gen
		test_text = "d"
		k = KeyGenerator.new
		key_pair = k.generate_key_pair
		encrypted = k.encrypt_value(number: Numberizer.get_number_value(letter: test_text), e: key_pair[:e], n: key_pair[:n])
		decrypted = k.decrypt_value(encrypted: encrypted, d: key_pair[:d], n: key_pair[:n])
		puts encrypted, decrypted
		assert_equal test_text, Numberizer.get_letter_value(number: decrypted)
	end
end

t = Tests.new
t.run_tests