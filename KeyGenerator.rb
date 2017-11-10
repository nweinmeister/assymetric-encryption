require('prime')

class KeyGenerator
	def generate_key_pair
		p = get_random_prime
		q = get_random_prime
		n = p * q
		phi = (p-1) * (q-1)
		e = 3
		while phi.gcd(e) > 1
			e += 2
		end

		d = 1
		while phi % (e*d-1) != 0
			d += 1
		end
		
		gcd = e.gcd(phi)
		# d = (phi + gcd)/e
		{e: e, d: d, n: n}
	end

	def encrypt_value(number:, e:, n:)
		(number**e) % n
	end

	def decrypt_value(encrypted:, d:, n:)
		(encrypted**d) % n
	end

	def get_random_prime
		r = Prime.take(4)[Random.rand(4)-1]
		puts "prime", r 
		r
	end
end