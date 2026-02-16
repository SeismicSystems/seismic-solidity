{
    let x := calldataload(0)
    let y := calldataload(32)
    cstore(x, y)
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
//         let y := calldataload(32)
//         cstore(x, y)
//         mstore(_1, y)
//     }
// }
