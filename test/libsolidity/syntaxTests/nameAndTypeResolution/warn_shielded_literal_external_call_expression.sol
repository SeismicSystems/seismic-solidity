// Expression in external call arg (arithmetic folded to literal) — context B (10402)
contract Target {
    function setVal(suint256 x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(suint256(1 + 2));
    }
}
// ----
// Warning 10402: (233-248): Literals converted to shielded integers will leak during contract deployment.
