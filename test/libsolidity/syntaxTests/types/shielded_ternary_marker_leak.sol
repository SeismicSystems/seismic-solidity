contract C {
    sbytes private secret;
    bytes private public_b;
    function f(bool c) external {
        (c ? bytes(secret) : public_b).push(0x42);
    }
}
// ----
// Warning 10305: (17-38): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 1080: (111-139): True expression's type bytes storage pointer does not match false expression's type bytes storage pointer.
