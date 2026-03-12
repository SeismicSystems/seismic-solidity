// External call with sbytes4 literal — emits context B warning (10411)
contract Target {
    function setVal(sbytes4 x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(sbytes4(0x01020304));
    }
}
// ----
// Warning 10411: (217-236): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
