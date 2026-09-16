{
  function f() -> x { x := mload(g()) }
    // In Seismic, SLOAD is marked as having effects because it can revert.
    // Therefore, it cannot be hoisted out of loops.
  function g() -> x { x := add(sload(x), 1) }

  let b := 1
  for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
    let t := balance(f())
    let q := g()
  }
}
// ----
// step: loopInvariantCodeMotion
//
// {
//     let b := 1
//     let a := 1
//     for { } iszero(eq(a, 10)) { a := add(a, 1) }
//     {
//         let t := balance(f())
//         let q := g()
//     }
//     function f() -> x
//     { x := mload(g()) }
//     function g() -> x_1
//     { x_1 := add(sload(x_1), 1) }
// }
