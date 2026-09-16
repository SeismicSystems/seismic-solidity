{
    let b := 1
    // SLOAD should NOT be hoisted even though there's no storage write in the loop.
    // In Seismic, SLOAD can revert due to confidentiality mismatch.
    // Hoisting it out of a zero-iteration loop would change behavior from
    // non-reverting to reverting.
    for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
        let inv := add(b, 42)
        let x := sload(mul(inv, 3))
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
//     for { } iszero(eq(a, 10)) { a := add(a, 1) }
//     {
//         let x := sload(mul(inv, 3))
//         a := add(x, 1)
//         mstore(a, inv)
//     }
// }
