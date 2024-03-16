use dep::lib::compute_merkle_root::compute_merkle_root;

global MERKLE_DEPTH = 32;

pub fn main(leaf: Field, index: Field, hash_path: [Field; MERKLE_DEPTH]) -> pub Field {
    compute_merkle_root(leaf, index, hash_path)
}
