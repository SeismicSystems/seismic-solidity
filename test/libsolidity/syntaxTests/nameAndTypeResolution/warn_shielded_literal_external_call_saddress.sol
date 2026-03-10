// External call with saddress literal — emits context B warning (5508)
contract Target {
    function setVal(saddress x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(saddress(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF));
    }
}
// ----
// Warning 5508: (219-271): Address Literals converted to shielded addresses will leak during contract deployment.
