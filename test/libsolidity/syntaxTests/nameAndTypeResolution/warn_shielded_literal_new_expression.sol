// new expression with shielded literal — SHOULD warn (literal in init code)
contract Child {
    suint256 private val;
    constructor(suint256 _val) { val = _val; }
}

contract Parent {
    function test() external {
        new Child(suint256(99));
    }
}
// ----
// Warning 9660: (239-251): Literals converted to shielded integers will leak during contract deployment.
