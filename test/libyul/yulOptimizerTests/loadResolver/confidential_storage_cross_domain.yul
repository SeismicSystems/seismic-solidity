{
    let x := calldataload(0)
    let y := calldataload(32)
    sstore(x, y)
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
//         sstore(x, calldataload(32))
//         mstore(_1, cload(x))
//     }
// }
