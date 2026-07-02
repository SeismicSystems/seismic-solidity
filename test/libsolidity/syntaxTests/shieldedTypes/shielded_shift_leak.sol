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
// Warning 10315: (115-126): Shielded integer shift count can leak through the public shift result.
// Warning 10312: (136-148): Shielded integer shift count can leak through the public shift result.
// Warning 10315: (162-173): Shielded integer shift count can leak through the public shift result.
