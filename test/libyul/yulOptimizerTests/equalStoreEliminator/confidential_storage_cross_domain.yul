{
    let x := calldataload(0)
    let y := calldataload(32)
    sstore(x, y)
    // This cstore should NOT be eliminated (different domain)
    cstore(x, y)
}
// ====
// EVMVersion: >=mercury
// ----
// step: equalStoreEliminator
//
// {
//     let x := calldataload(0)
//     let y := calldataload(32)
//     sstore(x, y)
//     cstore(x, y)
// }
