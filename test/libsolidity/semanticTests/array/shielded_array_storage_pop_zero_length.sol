contract C {
    suint[] storageArray;
    function popEmpty() public {
        storageArray.pop();
    }
}
// ====
// EVMVersion: >=mercury
// ----
// popEmpty() -> FAILURE, hex"4e487b71", 0x31

