contract C {
    function f() public returns (uint t) {
        assembly {
            t := txtype()
        }
    }
}
// ====
// EVMVersion: >=mercury
// ----
// f() -> 0
