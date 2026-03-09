// new expression with multiple shielded types — all SHOULD warn
contract Child {
    suint256 private a;
    sbool private b;
    constructor(suint256 _a, sbool _b) { a = _a; b = _b; }
}

contract Parent {
    function test() external {
        new Child(suint256(10), sbool(true));
    }
}
// ----
// Warning 9660: (258-270): Literals converted to shielded integers will leak during contract deployment.
// Warning 9661: (272-283): Bool Literals converted to shielded bools will leak during contract deployment.
