{
    // Different literal slots: no cross-domain conflict, so both stores are dead before the
    // revert (which rolls back storage) and may be eliminated.
    cstore(0, 1)
    sstore(1, 2)
    mstore(0, 0x1234)
    revert(0, 32)
}
// ====
// EVMVersion: >=mercury
// ----
// step: unusedStoreEliminator
//
// {
//     {
//         let _1 := 1
//         let _2 := 0
//         let _3 := 2
//         let _4 := 1
//         mstore(0, 0x1234)
//         revert(0, 32)
//     }
// }
