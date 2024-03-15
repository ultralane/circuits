use dep::std::hash::poseidon2::Poseidon2;

struct KeyPair {
    public_key: Field,
    private_key: Field,
}

impl KeyPair {
    pub fn new(private_key: Field) -> KeyPair {
        KeyPair { public_key: Poseidon2::hash([private_key], 1), private_key }
    }
}

#[test]
fn test_keypair_publickey() {
    let key = KeyPair::new(1);
    assert_eq(key.public_key, Poseidon2::hash([1], 1));
}
