use dep::lib::note::Note;

fn main(input: Note) -> pub (Field, Field) {
    (input.amount, input.commitment())
}
