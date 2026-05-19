{
    let x := calldataload(0)
    let y := calldataload(32)
    cstore(x, y)
    sstore(x, 99)
    // cload must NOT be resolved to y: sstore between cstore and cload invalidates the cached value
    let z := cload(x)
    mstore(0, z)
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
//         cstore(x, calldataload(32))
//         sstore(x, 99)
//         mstore(_1, cload(x))
//     }
// }
