require('prime')

class KeyGenerator
	def generate_key_pair
		p = get_random_prime
		q = get_random_prime
		n = p * q
		phi = (p-1) * (q-1)
		e = [p, q].min
		while phi.gcd(e) > 1
			e += 1
		end
		d = [p, q].min
		while (d*e) % phi != 1
			d += 1
		end
		gcd = e.gcd(phi)
		# d = (phi + gcd)/e
		{e: e, d: d, n: n}
	end

	def get_random_prime
		r = Prime.take(100)[Random.rand(60..100)-1]
		r
	end
end