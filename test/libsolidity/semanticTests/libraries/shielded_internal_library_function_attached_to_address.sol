library L {
    function equals(saddress a, saddress b) internal pure returns (bool) {
        return bool(a == b);
    }
}

contract C {
    using L for saddress;

    function foo(saddress a, saddress b) public returns (bool) {
        return a.equals(b);
    }
}
// ----
// foo(saddress,saddress): 0x111122223333444455556666777788889999aAaa, 0x111122223333444455556666777788889999aAaa -> true
// foo(saddress,saddress): 0x111122223333444455556666777788889999aAaa, 0x0000000000000000000000000000000000000000 -> false
