{
  let b := 1
  for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
    let inv := add(b, 42)
    // In Seismic, SLOAD is marked as having effects because it can revert.
    // Therefore, it cannot be hoisted out of loops.
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
