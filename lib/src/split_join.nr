use crate::{input::Input, note::Note};

pub fn split_join<MERKLE_DEPTH, NUM_INPUTS, NUM_OUTPUTS>(
    root: Field,
    inputs: [Input<MERKLE_DEPTH>; NUM_INPUTS],
    outputs: [Note; NUM_OUTPUTS],
    deposit_amount: Field,
    _ext_data: Field
) -> ([Field; NUM_INPUTS], [Field; NUM_OUTPUTS]) {
    // first check if all inputs exist in the merkle root provided
    for i in 0..NUM_INPUTS {
        inputs[i].assert_root(root);
    }

    let mut input_sum = 0;
    for i in 0..NUM_INPUTS {
        input_sum += inputs[i].note.amount;
    }

    let mut output_sum = 0;
    for i in 0..NUM_OUTPUTS {
        output_sum += outputs[i].amount;
    }

    assert(input_sum + deposit_amount == output_sum, "input sum + deposit_amount must equal output sum");
    // TODO fix the overflow issue
    // assert(output_sum.lt(MID_FIELD) | output_sum.lt(MID_FIELD));

    let mut input_nullifier = [0; NUM_INPUTS];
    for i in 0..NUM_INPUTS {
        input_nullifier[i] = inputs[i].note.nullifier(inputs[i].path_index);
    }

    let mut output_commitments = [0; NUM_OUTPUTS];
    for i in 0..NUM_OUTPUTS {
        output_commitments[i] = outputs[i].commitment();
    }

    (input_nullifier, output_commitments)
}
