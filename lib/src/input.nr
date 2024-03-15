use crate::{note::Note, compute_merkle_root::compute_merkle_root};

struct Input<MERKLE_DEPTH> {
    note: Note,
    path_index: Field,
    path_elements: [Field; MERKLE_DEPTH],
}

impl <MERKLE_DEPTH> Input<MERKLE_DEPTH> {
    fn new(note: Note, path_index: Field, path_elements: [Field; MERKLE_DEPTH]) -> Self {
        Input { note, path_index, path_elements }
    }

    fn assert_root(self, root: Field) {
        let leaf = self.note.commitment();
        assert_eq(root, compute_merkle_root(leaf, self.path_index, self.path_elements));
    }
}
