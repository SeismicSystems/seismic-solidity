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
// Warning 10312: (89-101): Shielded integer shift count can leak through the public shift result.
// Warning 10312: (111-123): Shielded integer shift count can leak through the public shift result.
// Warning 10312: (137-149): Shielded integer shift count can leak through the public shift result.
// Warning 10312: (159-171): Shielded integer shift count can leak through the public shift result.
