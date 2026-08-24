// Shifting a public value by a shielded amount yields a shielded result, so it cannot flow to a
// public destination (mirrors public ** shielded). The prior warning-only leak is now an error.
contract C {
    suint8 private secret;
    uint256 a;
    function f() public {
        a <<= secret;
        a = a << secret;
        a >>= secret;
        a = a >> secret;
    }
}
// ----
// TypeError 7366: (283-295): Operator <<= not compatible with types uint256 and suint8.
// TypeError 7407: (309-320): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 7366: (330-342): Operator >>= not compatible with types uint256 and suint8.
// TypeError 7407: (356-367): Type suint256 is not implicitly convertible to expected type uint256.
