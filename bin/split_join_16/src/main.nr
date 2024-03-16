use dep::lib::{input::Input, note::Note, split_join::split_join};

global MERKLE_DEPTH = 16;
global NUM_INPUTS = 2;
global NUM_OUTPUTS = 1;

pub fn main(
    root: pub Field,
    inputs: [Input<MERKLE_DEPTH>; NUM_INPUTS],
    outputs: [Note; NUM_OUTPUTS],
    deposit_amount: pub Field,
    ext_data: pub Field
) -> pub ([Field; NUM_INPUTS], [Field; NUM_OUTPUTS]) {
    split_join(root, inputs, outputs, deposit_amount, ext_data)
}
