use crate::hash::{hash_1, hash_2, hash_3};

struct KeyPair {
    public_key: Field,
    private_key: Field,
}

impl KeyPair {
    pub fn new(private_key: Field) -> KeyPair {
        KeyPair { public_key: hash_1([private_key]), private_key }
    }

    pub fn sign_1(self, m: Field) -> Field {
        hash_2([self.private_key, m])
    }

    pub fn sign_2(self, m1: Field, m2: Field) -> Field {
        hash_3([self.private_key, m1, m2])
    }
}

#[test]
fn test_keypair_publickey() {
    let key = KeyPair::new(1);
    assert_eq(key.public_key, hash_1([1]));
}

#[test]
fn test_keypair_sign_1() {
    let key = KeyPair::new(1);

    let signature = key.sign_1(1);
    assert_eq(signature, hash_2([1, 1]));
}

#[test]
fn test_keypair_sign_2() {
    let key = KeyPair::new(1);

    let signature = key.sign_2(1, 2);
    assert_eq(signature, hash_3([1, 1, 2]));
}
