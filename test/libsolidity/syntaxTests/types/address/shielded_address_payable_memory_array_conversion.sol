contract C {
    function f() public pure {
        saddress payable[] memory a = new saddress payable[](4);
        saddress[] memory b = new saddress[](4);
        a = b;
        b = a;
    }
}
// ----
// TypeError 7407: (170-171): Type saddress[] memory is not implicitly convertible to expected type saddress payable[] memory.
// TypeError 7407: (185-186): Type saddress payable[] memory is not implicitly convertible to expected type saddress[] memory.
