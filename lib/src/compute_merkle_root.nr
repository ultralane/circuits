use crate::hash::hash_2;

pub fn compute_merkle_root<MERKLE_DEPTH>(
    leaf: Field,
    index: Field,
    hash_path: [Field; MERKLE_DEPTH]
) -> Field {
    let n = hash_path.len();
    let index_bits = index.to_le_bits(n as u32);
    let mut current = leaf;
    for i in 0..n {
        let path_bit = index_bits[i] as bool;
        let (hash_left, hash_right) = if path_bit {
            (hash_path[i], current)
        } else {
            (current, hash_path[i])
        };
        current = hash_2([hash_left, hash_right]);
    }
    current
}
