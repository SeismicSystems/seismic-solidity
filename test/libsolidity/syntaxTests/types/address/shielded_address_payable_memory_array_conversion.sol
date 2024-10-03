contract C {
    function f() public pure {
        saddress payable[] memory a = new saddress payable[](4);
        saddress[] memory b = new saddress[](4);
        a = b;
        b = a;
    }
}
// ----
// TypeError 7407: (166-167): Type saddress[] memory is not implicitly convertible to expected type saddress payable[] memory.
// TypeError 7407: (181-182): Type saddress payable[] memory is not implicitly convertible to expected type saddress[] memory.
