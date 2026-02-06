// Audit regression: cstore with caller() value followed by sload on same literal slot
contract C {
    event e(uint);
    function test() external {
        uint c;
        assembly {
            cstore(0, caller())
            c := sload(0)
        }
        emit e(c);
    }
}
// ----
// TypeError 5768: (234-242): Cannot use sload() on a slot that was previously written with cstore(). cstore() makes the slot private, and sload() cannot access private storage. Use cload() instead.
