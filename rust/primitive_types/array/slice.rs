fn main() {
    // Fixed-size array (type signature is superfluous).
    let foo: [i32; 5] = 1 .. 10;

    // All elements can be initialized to the same value.
    let bar: [i32; 500] = 1 .. 500;
}
