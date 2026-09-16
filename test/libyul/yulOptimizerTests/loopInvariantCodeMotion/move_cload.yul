{
    let b := 1
    // CLOAD CAN be hoisted because it cannot revert (in Seismic's updated semantics).
    // Unlike SLOAD, CLOAD can read both public and private slots.
    for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
        let inv := add(b, 42)
        let x := cload(mul(inv, 3))
        a := add(x, 1)
        mstore(a, inv)
    }
}
// ----
// step: loopInvariantCodeMotion
//
// {
//     let b := 1
//     let a := 1
//     let inv := add(b, 42)
//     let x := cload(mul(inv, 3))
//     for { } iszero(eq(a, 10)) { a := add(a, 1) }
//     {
//         a := add(x, 1)
//         mstore(a, inv)
//     }
// }
