contract C {
    function f(saddress a) public pure returns (address x) {
        saddress b = a;
        x = address(b);
    }
}
// ----
// f(saddress): 0x1234 -> 0x1234
// f(saddress): 0x00 -> 0x00
// f(saddress): 0x111122223333444455556666777788889999aAaa -> 0x111122223333444455556666777788889999aAaa
