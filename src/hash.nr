use dep::std::hash::poseidon2::Poseidon2;

pub fn hash_1(input: [Field; 1]) -> Field {
    // poseidon::hash_1(input)
    // pedersen_hash(input)
    Poseidon2::hash(input, 1)
}

pub fn hash_2(input: [Field; 2]) -> Field {
    // poseidon::hash_2(input)
    // pedersen_hash(input)
    Poseidon2::hash(input, 2)
}

pub fn hash_3(input: [Field; 3]) -> Field {
    // poseidon::hash_3(input)
    // pedersen_hash(input)
    Poseidon2::hash(input, 3)
}
