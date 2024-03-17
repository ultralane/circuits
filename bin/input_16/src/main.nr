use dep::lib::input::Input;

global MERKLE_DEPTH = 16;

fn main(root: pub Field, input: Input<MERKLE_DEPTH>, _ext_address: pub Field) -> pub (Field, Field) {
    input.assert_root(root);
    (input.note.amount, input.note.nullifier(input.path_index))
}
