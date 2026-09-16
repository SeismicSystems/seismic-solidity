{
    // cstore claims slot 0 confidential; the sstore to the same slot reverts at runtime
    // (cross-domain). Both must be kept even though they precede an explicit revert, so the
    // runtime revert fires. Slot operands are literals (Operation.start is empty for them).
    cstore(0, 1)
    sstore(0, 2)
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
//         cstore(0, 1)
//         sstore(0, 2)
//         mstore(0, 0x1234)
//         revert(0, 32)
//     }
// }
