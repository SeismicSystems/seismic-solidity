{
    let x := calldataload(0)
    let y := calldataload(32)
    cstore(x, y)
    // This cstore should be eliminated (same key, same value)
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
//     cstore(x, y)
// }
