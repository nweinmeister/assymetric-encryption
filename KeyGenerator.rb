require('prime')

class KeyGenerator
	def generate_key_pair
		p = get_random_prime
		q = get_random_prime
		n = p * q
		phi = (p-1) * (q-1)
		e = calculate_e(starting_point: [p, q].min, phi: phi)
		d = calculate_d(starting_point: [p, q].min, e: e, phi: phi)
		{public_key: [e, n].join("&"), private_key: [d, n].join("&")}
	end

	def get_random_prime
		r = Prime.take(100)[Random.rand(60..100)-1]
		r
	end

	def calculate_e(starting_point:, phi:)
		e = starting_point
		while phi.gcd(e) > 1
			e += 1
		end
		e
	end

	def calculate_d(starting_point:, e:, phi:)
		d = starting_point
		while (d*e) % phi != 1
			d += 1
		end
		d
	end
end