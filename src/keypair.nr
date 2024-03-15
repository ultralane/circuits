use crate::hash::hash_1;

struct KeyPair {
    public_key: Field,
    private_key: Field,
}

impl KeyPair {
    pub fn new(private_key: Field) -> KeyPair {
        KeyPair { public_key: hash_1([private_key]), private_key }
    }
}

#[test]
fn test_keypair_publickey() {
    let key = KeyPair::new(1);
    assert_eq(key.public_key, hash_1([1]));
}
