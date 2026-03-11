// Enum to shielded in external call — emits context B warning (5510)
contract Target {
    function setVal(suint8 x) external {}
}

contract Caller {
    enum Color { Red, Green, Blue }
    Target t;

    function test() external {
        t.setVal(suint8(Color.Red));
    }
}
// ----
// Warning 5510: (252-269): Enums converted to shielded integers will leak during contract deployment.
