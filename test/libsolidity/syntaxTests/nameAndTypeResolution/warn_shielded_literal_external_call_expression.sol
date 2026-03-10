// Expression in external call arg (arithmetic folded to literal) — context B (5506)
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
// Warning 5506: (232-247): Literals converted to shielded integers will leak during contract deployment.
