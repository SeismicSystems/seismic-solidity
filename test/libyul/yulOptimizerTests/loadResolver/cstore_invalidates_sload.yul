{
    let x := calldataload(0)
    let y := calldataload(32)
    sstore(x, y)
    let z := calldataload(64)
    cstore(x, z)
    // sload must NOT be resolved: cstore claims the slot, so sload would fail at runtime
    let w := sload(x)
    mstore(0, w)
}
// ====
// EVMVersion: >=mercury
// ----
// step: loadResolver
//
// {
//     {
//         let _1 := 0
//         let x := calldataload(_1)
//         sstore(x, calldataload(32))
//         cstore(x, calldataload(64))
//         mstore(_1, sload(x))
//     }
// }
