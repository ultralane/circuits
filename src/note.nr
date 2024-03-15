use crate::{keypair::KeyPair, hash::hash_3};

struct Note {
    amount: Field,
    keypair: KeyPair,
    blinding: Field,
}

impl Note {
    fn new(amount: Field, keypair: KeyPair, blinding: Field) -> Note {
        Note { amount, keypair, blinding }
    }

    fn commitment(self) -> Field {
        hash_3([self.amount, self.keypair.public_key, self.blinding])
    }

    fn nullifier(self, merkle_index: Field) -> Field {
        let commitment = self.commitment();
        hash_3([commitment, merkle_index, self.keypair.sign_2(commitment, merkle_index)])
    }
}

#[test]
fn test_note_commitment() {
    let key = KeyPair::new(1);
    let note = Note::new(1, key, 1);
    assert_eq(note.commitment(), hash_3([1, key.public_key, 1]));
}

#[test]
fn test_note_nullifier() {
    let key = KeyPair::new(1);
    let note = Note::new(1, key, 1);
    let commitment = note.commitment();
    let nullifier = note.nullifier(1);
    // println(commitment);
    // println(nullifier);
    assert_eq(nullifier, hash_3([commitment, 1, key.sign_2(commitment, 1)]));
}
