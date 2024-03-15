use dep::std::hash::pedersen_hash;

struct KeyPair {
    public_key: Field,
    private_key: Field,
}

impl KeyPair {
    pub fn new(private_key: Field) -> KeyPair {
        KeyPair { public_key: pedersen_hash([private_key]), private_key }
    }
}

#[test]
fn test_keypair_publickey() {
    let key = KeyPair::new(1);
    assert_eq(key.public_key, pedersen_hash([1]));
}
