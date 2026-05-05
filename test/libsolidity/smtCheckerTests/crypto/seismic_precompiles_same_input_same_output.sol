contract C {
	function h(bytes memory b0) public view {
		bytes memory b1 = b0;
		bytes32 k0 = hkdf(b0);
		bytes32 k1 = hkdf(b1);
		assert(k0 == k1);
	}
	function e(sbytes32 priv, bytes memory pub) public view {
		bytes32 a0 = ecdh(priv, pub);
		bytes32 a1 = ecdh(priv, pub);
		assert(a0 == a1);
	}
	function ge(sbytes32 key, uint96 nonce, bytes memory plain) public view {
		bytes memory c0 = aes_gcm_encrypt(key, nonce, plain);
		bytes memory c1 = aes_gcm_encrypt(key, nonce, plain);
		assert(c0.length == c1.length);
	}
	function gd(sbytes32 key, uint96 nonce, bytes memory cipher) public view {
		bytes memory p0 = aes_gcm_decrypt(key, nonce, cipher);
		bytes memory p1 = aes_gcm_decrypt(key, nonce, cipher);
		assert(p0.length == p1.length);
	}
	function s(sbytes32 priv, bytes32 hashed) public view {
		bytes memory s0 = secp256k1_sign(priv, hashed);
		bytes memory s1 = secp256k1_sign(priv, hashed);
		assert(s0.length == s1.length);
	}
}
// ====
// SMTEngine: bmc
// ----
// Info 6002: BMC: 5 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
